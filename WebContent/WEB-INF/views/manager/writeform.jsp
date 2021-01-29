<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
	<!DOCTYPE html>
	<html>
	<head>
	
	
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${root}/resources/css/mainhome.css">
	<link rel="stylesheet" href="${root}/resources/css/write.css">
	
	</head>
			<body>
				<div class="headerwrap">
	      			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
				</div>
				<div class="body">
					<div id="title">
						<h2 style="text-align: center; color: black;">상품등록 페이지</h2>
					</div>
					
					<div align="center" id="body">
						<h3>상품 주요정보</h3>
						<div class="blend" style="height:20px;
							border:5px;
							background-color:#f1f3f5;
							background-size:cover;
							background-blend-mode:difference;
							transition:background-color 2s;">
						</div>
						<br />
						<form enctype="multipart/form-data" method="post" id="itemsWrite">
							<ul>
								<li>
									<label for="itemsName;">제품명:</label>
									<input type="text"id="itemsName" name="itemsName"/><br /> 
								</li>
								<li>
									<label for="itemsPrice">가격:</label>
									<input type="text" id="itemsPrice" name="itemsPrice"/><br /> 
								</li>
								<li>
									<label for="itemsModel"> 모델명:</label>
									<input type="text" id="itemsModel" name="itemsModel"><br /> 
								</li>
								<li>
									<label for="itemsCompany"> 브랜드:</label>
									<input type="text" id="itemsCompany" name="itemsCompany"/><br />
								</li>
								<li>
									<label for="itemsContext">제품 설명: </label>
									<input type="text" id="itemsContext" name="itemsContext"/><br />
								</li>
								<li>
									<label for="itemsManufacture"> 제조사:</label> 
									<input type="text" id="itemsManufacture"name="itemsManufacture"><br /> <br /> 
								</li>
								<li>
									<label for="itemsOrigin">원산지:</label> 
									<input type="text" id="itemsOrigin" name="itemsOrigin"><br /><br />
								</li>
								<li>
									<label for="itemsOption">제품 옵션:</label>
									<input type="text" id="itemsOption" name="itemsOption"/><br /><br />
								</li>
								<li>
									<label for="itemsColor">제품 색상:</label>
									<input type="text" id="itemsColor" name="itemsColor"/><br /><br />
								</li>
								<li>
									<label for="itemsStock">제품 수량</label>
									<input type="text" id="itemsStock" name="itemsStock" /><br /><br />
								</li>
								<li>
									<label for="itemsAttach">이미지 첨부 </label>
									<input type="file" id="itemsAttach" name="itemsAttach" value="이미지 첨부" /><br /> <br />
								</li>
							</ul>
						</form>
						<hr />
					<div class="d-flex justify-content-center ml-3">
						<a href="javascript:saveMain()" id="savebtn" type="submit" class="btn btn-primary" style="color: white">저장</a>
						<a href="javascript:history.back()" class="btn btn-danger">취소</a>
					</div>
				
														
			<div class="footerwrap">
	      		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
			</div>
		</body>
		
		<script>
			const saveMain = function() {
			    console.log(event);
					
			const name = $("#itemsName");
			const price = $("#itemsPrice");
			const company = $("#itemsCompany");
			const context = $("#itemsContext");
			const model = $("#itemsModel");
			const mnc = $("#itemsManufacture");
			const origin = $("#itemsOrigin");
			const options = $("#itemsOption");
			const stock = $("#itemsStock");
			const attach = $("#itemsAttach");
	
			if (name.val() === "" | price.val() === "" | company.val() === "" |
				context.val() === "" | model.val() === "" | mnc.val() === "" | origin.val() === "" | options.val()=="" | stock.val()=="" | attach.val()=="") {
				window.alert("모두 입력되어야합니다");
				return;
			}
			else {
				//서버로 데이터 전송
				//const reviseForm = document.reviseForm; //form에 name 저장되어 있으면 바로 가져올 수 있음.
				const result = window.confirm("저장을 완료하시겠습니까?");
				if(result){
					$("#itemsWrite").attr("action", "${root}/manager/write").submit();
				/*$(function(){
				        $.ajax({
				            url:"saveupdate",
				            method: "get"
				        })
				    }) */
				}
			}
		}
		</script>
		</html>