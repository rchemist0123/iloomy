package com.mycompany.webapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.DeliveryDTO;
import com.mycompany.webapp.dto.DeliveryStatus;
import com.mycompany.webapp.dto.ItemsDTO;
import com.mycompany.webapp.dto.OrderItemsDTO;
import com.mycompany.webapp.dto.OrderStatus;
import com.mycompany.webapp.dto.OrdersDTO;
import com.mycompany.webapp.dto.UserDTO;
import com.mycompany.webapp.service.DeliveryService;
import com.mycompany.webapp.service.ItemsService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.OrderService;

@Controller
@RequestMapping("product")
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
    
    @Resource 
    OrderService orderService;
    @Resource 
    MemberService memberService;
    @Resource 
    DeliveryService deliveryService;
    @Autowired
    MemberService mService;
    
    @Resource private ItemsService itemsService;
    
  //제품 목록 보여주기
    @GetMapping("/list") 
    public String itemslist(Model model){
    	List<ItemsDTO> list = itemsService.getItemsList();
    	model.addAttribute("list", list);
        logger.info("실행 : product/list");
        return "product/productList";
    }
    
    //사진 정보 불러오기
    @GetMapping(value = "/itemsAttach")
    public void itemsAttach(int no, HttpSession sesson, HttpServletResponse response) throws Exception {
    	
    	ItemsDTO item = itemsService.getItem(no);
        String filePath = null;

        
        if(item.getItemsAttachOname() != null) {
        	String itemAttach = item.getItemsAttachSname();
        	filePath = "D:/MW/uploadfiles/items/" + itemAttach;
        	
        	response.setContentType(item.getItemsAttachtype());
        	
        	String oname = item.getItemsAttachOname();
        	oname = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
        	response.setHeader("Content-Disposition", "attachment; filename=\""+ oname +"\"");
        } else {
        	filePath= "D:/MW/uploadfiles/items/defaultimage.jpg";
        	response.setContentType("image/jpg");
        }

        OutputStream os = response.getOutputStream();
        InputStream is = new FileInputStream(filePath);
        FileCopyUtils.copy(is,os);
        os.flush();
        os.close();
        is.close();
    }
    
    
    //상세보기 페이지로 이동
    @GetMapping("/detail")
    public String itemsDetail(int no, Model model){
        logger.info("실행 : product/detail");
        ItemsDTO item = itemsService.getItem(no); // dto에서 정보 받기
        model.addAttribute("lno", no);
        model.addAttribute("item", item);
        System.out.println(item.toString());
        return "product/productDetail";
    }

     //------------------------------------------------------------------------------
    
    @GetMapping(value = "cart2")  //연결 header에서 지선 추가
    public String cart2(){
        logger.info("실행 : product/cart2");
        return "product/cart";
    }

    @PostMapping(value = "cart") 
    public String cart(int lno, String itemsName, HttpSession session, HttpServletRequest req){
		//user
		String userId = (String)session.getAttribute("userinfo");
		UserDTO users = memberService.selectAddress(userId);
		
     	//delivery
		DeliveryDTO deliveryDTO = new DeliveryDTO(users.getAddress(), DeliveryStatus.Before);
//		deliveryService.saveDelivery(deliveryDTO);  //세이브 확인
		System.out.println("2. deliveryDTO : "+deliveryDTO.toString());
		
		//orders
		OrdersDTO orderDTO = new OrdersDTO();
		orderDTO.setMembersMembersId(userId);
		orderDTO.setDeliveryDeliveryNo(deliveryDTO.getDeliveryNo());
		orderDTO.setOrderStatus(OrderStatus.Cart);	
//		orderService.saveOrder(orderDTO);  //세이브 확인
		System.out.println("3. orderDTO : "+orderDTO.toString());
		
		//items정보 가져오기 (itemsName, option, color)
		String itemsColor = req.getParameter("itemsColor");
		String itemsOption = req.getParameter("itemsOption");
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemsName", itemsName);
		map.put("itemsColor", itemsColor);
		map.put("itemsOption", itemsOption);
		
		System.out.println(itemsName+" "+itemsColor+" "+itemsOption);
		
		ItemsDTO item = itemsService.selectItem(map);  
		System.out.println("4. ItemsDTO : "+item.toString());
		
    	//order_items저장  items FK, count, price 받음
		OrderItemsDTO orderItemsDTO =  new OrderItemsDTO(1, item.getItemsPrice(), item.getItemsNo());  
		orderService.order(userId, deliveryDTO, orderDTO, orderItemsDTO);
		System.out.println("5. orderItemsDTO : "+orderItemsDTO.toString());

		
		//order_items를 불러와서 orders의 status가 카트인것만 보여주기
		//product number 받기와 추가로 넣을 때는 어떻게 할지 status=cart에 있는거
		// status=cart에 있는거 list로 받아옴
		List<OrderItemsDTO> orderItemLists = orderService.getItemCart();
		
		///////////////////////////////////////////////////////////////
		List<Map<String, Object>>list  = new ArrayList<>();
		Map<String, Object> orderTest = new HashMap<String, Object>();
		for (int i=0; i<orderItemLists.size(); i++) {
			OrderItemsDTO ord = orderItemLists.get(i); 
			int orderItemsNo = ord.getOrderItemsNo();
			int orderItemsCount = ord.getOrderItemsCount();
			long orderItemsPrice = ord.getOrderItemsPrice();
			orderTest.put("orderItemsCount", orderItemsCount); //
			orderTest.put("orderItemsPrice", orderItemsPrice);//
			orderTest.put("orderItemsNo", orderItemsNo);
			List<String> test = new ArrayList<String>();
			for(int j =0; j<ord.getItemList().size(); j++) {
				ItemsDTO ite = ord.getItemList().get(j);
				String color = ite.getItemsColor(); //
				String option = ite.getItemsOption(); //
				String name = ite.getItemsName();
				test.add(option);
				test.add(color);
				test.add(name);
			}
			orderTest.put("options", test);//
			list.add(orderTest);
		}
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		//////////////////////////////////////////////////////////////
		session.setAttribute("orderItemLists", list);
//		System.out.println("6. OrderItemsDTO : "+orderItemLists.toString());
//		ItemsDTO pDTO = new ItemsDTO();
//		pDTO.setItemsNo(lno);
//		pDTO.setItemsName(itemsName);
//		pDTO.setItemsColor(itemsColor);
//		pDTO.setItemsOption(itemsOption);
//		pDTO.setItemsPrice(1009000);
//    	
//		session.setAttribute("pDTO", pDTO);
        return "product/cart";//product/cart.jsp 연결
    }
    
    @GetMapping(value = "/order")
 	public String method1(OrderItemsDTO orderItem, HttpServletRequest request, Model model) throws Exception {
 		String [] arr = request.getParameterValues("check"); //itemsNo
 		for (String i : arr) {
 			System.out.println(i);
 		}
 
 		//테이블이 order_items, orders(status:cart), delivery(status:before)
 		//count랑 price 받아옴
 		
// 		if(hidden ==1) {
// 			
// 		}else if(hidden==2) {
// 			
// 		}
 		
// 		1.orderorderno 가져와고
// 		2. itemsItemsNo 가졍고
// 		3. orderItem.set(1);
// 						set(2);
// 						dao.save(orderItem);
     	orderItem.setItemsOrder(1, 2);
     	
     	OrdersDTO dtoa = new OrdersDTO();
     	dtoa.setOrderStatus(OrderStatus.Cart);
     	System.out.println(dtoa.toString());
     	
 		System.out.println(orderItem.toString());
 		
 		model.addAttribute("arr", arr);
 		return "product/order";
 	}
    

}

