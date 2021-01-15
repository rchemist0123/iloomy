<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>product list</title>
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/mainhome.css">
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/productList.css">
	</head>
	
	<body>
		<div class="headerwrap">
      		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		</div>
		
		<section>
			<nav>
				<h2 style="text-align: center;">소파</h2>
				<div id="pList">
					<a class="listCatalog" href="#">전체</a>
					<a class="listCatalog" href="#">일자형</a>
					<a class="listCatalog" href="#">카우치/코너</a>
					<a class="listCatalog" href="#">1인/소파베드</a>
					<a class="listCatalog" href="#">리클라이너</a>
					<a class="listCatalog" href="#">악세사리</a>
				</div>
				<hr/>
			</nav>
			<button onclick="location.href='writeform.html'" id="add" type="button" class="btn btn-outline-primary btn-sm">글쓰기</button>
			
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3" >
							<img src="/team/resources/img/p1.jpg" width=350px;>	
								<ul style="float: left;">
									<li><b>볼케</b></li>
									<li>1인 리클라이너 소파 (H가죽,전동)</li>
									<li style="color: red;">1,989,000원</li>
								</ul>
								<button type="button" onclick="location.href='revise.html'" class="btn btn-link" style="float: right;">수정</button>
								<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p2.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>케스터네츠</b></li>
								<li>펫 3인 SET(패브릭)(온라인몰 전용)</li>
								<li style="color: red;">1,099,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
								<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p3.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>루오바</b></li>
								<li>코너(가죽)</li>
								<li style="color: red;">2,540,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
								<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p4.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>마리</b></li>
								<li>3인(가죽)</li>
								<li style="color: red;">1,190,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						
					</div>
					<div class="row">
						<div class="col-lg-3">
							<img src="/team/resources/img/p5.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>캐스터네츠</b></li>
								<li>펫 2인 SET(패브릭)(온라인몰 전용)</li>
								<li style="color: red;">999,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p6.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>볼케</b></li>
								<li>1인 리클라이너 소파</li>
								<li style="color: red;">2,499,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p7.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>코펜하겐</b></li>
								<li>코너 소파(가죽)</li>
								<li style="color: red;">4,140,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p8.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>루오바</b></li>
								<li>3인(가죽)</li>
								<li style="color: red;">1,870,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3">
							<img src="/team/resources/img/p9.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>코모</b></li>
								<li>2인(패브릭)</li>
								<li style="color: red;">690,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p10.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>코펜하겐</b></li>
								<li>4인 소파(가죽)</li>
								<li style="color: red;">2,690,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/p11.jpg" width=350px;>
							<ul style="float: left;">
								<li><b>카이로</b></li>
								<li>4인 리클라이너 소파(가죽)</li>
								<li style="color: red;">3,290,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
						<div class="col-lg-3">
							<img src="/team/resources/img/ready.jpg" width=350px; height="350px">
							<ul style="float: left;">
								<li><b>???</b></li>
								<li>????</li>
								<li style="color: red;">?,???,000원</li>
							</ul>
							<button type="button" class="btn btn-link" style="float: right;">수정</button>
							<button type="button" class="btn btn-link" style="float: right;">삭제</button>
						</div>
					</div>
				</div>
			
		</section>
		
		<div class="footerwrap">
      		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>