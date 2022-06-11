<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>
<!DOCTYPE html>
<html>
<head>
<!-- /.website title -->
<title>VTC Theme | My account</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<meta charset="UTF-8" />
<!-- CSS Files -->
<link href="/sist/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/sist/css/font-awesome.min.css" rel="stylesheet">
<link href="/sist/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="/sist/css/animate.css" rel="stylesheet" media="screen">
<link href="/sist/css/owl.theme.css" rel="stylesheet">
<link href="/sist/css/owl.carousel.css" rel="stylesheet">
<link href="/sist/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<!-- Colors -->
<!-- <link href="css/css-index-blue.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
<link href="/sist/css/stacktable.css" rel="stylesheet" media="screen">
<link href="/sist/css/css-index-yellow.css" rel="stylesheet" media="screen">

<!-- Google Fonts -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

</head>

<body data-spy="scroll" data-target="#navbar-scroll">
	<!-- /.preloader -->
	<div id="preloader"></div>
	<div id="top"></div>


	<!-- /.parallax full screen background image -->
	<div class="fullscreen landing parallax blog-page"
		style="background-image: url('/sist/images/bg-baner.jpg');"
		data-img-width="2000" data-img-height="1333" data-diff="100">

		<div class="overlay">
			<div class="container">
				<div class="col-md-10 col-md-offset-1 text-center">

					<!-- /.logo -->
					<div class="logo wow fadeInDown" style="margin-top: 50px">
						<a href="index.do">Exhibition</a>
					</div>



				</div>
			</div>
		</div>
	</div>


	<!-- NAVIGATION -->
	<div id="menu">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-backyard">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand site-name" href="index.do">Exhibition</a>
			</div>

			<div id="navbar-scroll"
				class="collapse navbar-collapse navbar-backyard navbar-right">
				<ul class="nav navbar-nav">
					<li><a href="list.do">전체 전시 보기</a></li>
					<li><a href="loc.do">지역별 전시 보기</a></li>
					<li><a href="reservation.do">예약하기</a></li>
					<li><a href="list.do">게시판</a></li>

				</ul>
			</div>
		</div>
	</div>


	<!-- /.pricing section -->
	<div id="myaccount">
		<div class="container">
			<form class="d-flex" action="list.do" method="get">
				<button class="btn btn-outline-success" type="submit"
					style="float: right; height: 50px">Search</button>
				<input class="form-control me-2" type="search" placeholder="전시명을 입력하세요" name="ex_name"
					aria-label="Search" style="float: right; width: 200px" >
			</form>
		</div>
		<div class="container">
			<div class="text-center ">
				<!-- /.pricing title -->
				<h2 class="wow fadeInLeft">전시 리스트</h2>
				<div class="title-line wow fadeInRight"></div>
			</div>



			<div class="col-sm-9 account-data padding-b-50 padding-t-50">
				<div id="tab2" class="box-old-booking box-section animated fadeInUp">
					<h2 style="padding-bottom: 17px;">목록</h2>

					<!-- /.Cars section -->
					<div id="carssection">
						<div class="container">

							<div class="row carssections">
							<c:forEach var="exListView" items="${ exListView }">
								<div class="screen wow fadeInUp"
									data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z">
									<figure>
										<div class="screen wow fadeInUp"
											style="position: absolute; left: 350px; width: 900px; height: 400px">
											<strong>${ exListView.ex_name }</strong><br/>${ exListView.ex_intro }
										</div>
										<a href="exhibition_detail.do?ex_num=${ exListView.ex_num }&ex_hall_num=${ exListView.ex_hall_num }">
										<img src="http://localhost/sist/img/${ exListView.exhibition_poster }" style="width: 300px"/></a>
											 
									</figure>
								</div>
									</c:forEach>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

				<div class="text-center">
		<nav aria-label="Page navigation example">
			<ul class="pagination">

			
<c:if test="${ex_hall_num!=0 }">

    <li class="page-item"><a href="list.do?pageNum=${1}&ex_hall_num=${ex_hall_num}"><c:out value="${1 }"/></a></li>
  	 <c:forEach var="i" begin="1" end="${endPage }" step="1">
    	<li class="page-item"><a href="list.do?pageNum=${i}&ex_hall_num=${ex_hall_num}"><c:out value="${i+1 }"/></a></li>
    </c:forEach> 
</c:if>
<c:if test="${ex_hall_num==0 }">

    <li class="page-item"><a href="list.do?pageNum=${1}"><c:out value="${1 }"/></a></li>
  	 <c:forEach var="i" begin="1" end="${endPage }" step="1">
    	<li class="page-item"><a href="list.do?pageNum=${i}"><c:out value="${i+1 }"/></a></li>
    </c:forEach> 
</c:if>
			</ul>
		</nav>
	</div>



	<!-- /.footer -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="">
					<div class="col-md-4 col-sm-6">
						<h4>고객 센터</h4>
						<p>
							<strong>3조</strong> <br>전화 번호 :081) 123-1234 <br>상담 가능
							시간: AM 10:00~PM 05:00 <br>관련 이메일: exhibition@naver.com
						</p>
						<hr class="hidden-md hidden-lg">
					</div>


					<!-- /.col-md-4 -->

					<div class="col-md-4 col-sm-6">
						<h4>사업자 등록번호</h4>
						<div class="newsletter-box">
							<div class="newsletter">
								<div class="newsletter-content">
									<p>123-1234-1234</p>
								</div>

								<div class="clear"></div>
							</div>
						</div>
					</div>
					<!-- /.col-md-4 -->

				</div>
			</div>
		</div>
	</footer>




	<!-- /.javascript files -->
	<script src="/sist/js/jquery.js"></script>
	<script src="/sist/js/bootstrap.min.js"></script>
	<script src="/sist/js/bootstrap-datetimepicker.min.js"></script>
	<script src="/sist/js/custom.js"></script>
	<script src="/sist/js/jquery.sticky.js"></script>
	<script src="/sist/js/wow.min.js"></script>
	<script src="/sist/js/owl.carousel.min.js"></script>
	<script src="/sist/js/jquery.validate.min.js"></script>

	<script>
		new WOW().init();
		
		
	</script>


</body>
</html>