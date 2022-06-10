<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="/error.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>

        <!-- /.website title -->
        <title>VTC Theme | FQA Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <meta charset="UTF-8" />
        <!-- CSS Files -->
        <link href="/sist/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="/sist/css/font-awesome.min.css" rel="stylesheet">
        <link href="/sist/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="/sist/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
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
        <link href="/sist/css/css-index-yellow.css" rel="stylesheet" media="screen"> 

        <!-- Google Fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

    </head>

    <body data-spy="scroll" data-target="#navbar-scroll">

        <!-- /.preloader -->
        <div id="preloader"></div>
        <div id="top"></div>

        <!-- /.parallax full screen background image -->
        <div class="fullscreen landing parallax blog-page" style="background-image:url('images/bg-baner.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">

            <div class="overlay">
                <div class="container">
                    <div class="col-md-10 col-md-offset-1 text-center">

                        <!-- /.logo -->
                        <div class="logo wow fadeInDown" style="margin-top: 50px"> 
                            <a href="index.do">Exhibition</a>
                        </div>

                        <!-- /.main title -->
                        <h2 class="wow fadeInUp" style="margin-bottom: 50px">
                           아이디 찾기
                        </h2>

                    </div>
                </div> 
            </div> 
        </div>
        
        
            <!-- NAVIGATION -->
        

        <!-- /.Cars section -->
        <div id="sign-in" style="margin-left: 30%">
            <div class="container">
                <div class="col-sm-6">
                    <div class="text-center">
                        <h2 class="wow fadeInLeft">아이디찾기</h2>
                        <div class="title-line wow fadeInRight"></div>
                    </div>
                    <div class="row sign-in">

                        <form action="http://localhost/sist/user/login/idfind.do" method="post" name="frm" id="frm">
                            <div class="form-group">
                                <label for="email">이름</label>
                                <input class="form-control" id="name" type="text" name="name" value="">
                            </div>
                            <div class="form-group">
                                <label for="password">휴대번호</label>
                                <input class="form-control" id="tel" type="text" name="tel" value="">
                            </div>
                            <div class="text-center">
                              <input type="submit" id="findid" class="btn btn-warning btn-block btn-lg" value="찾기">
                            </div>
                          	<!-- 이름과 전화번호가 일치하지 않을 때 -->
                            <c:if test="${check == 1}">
							<script>
							opener.document.findform.name.value = "";
							opener.document.findform.tel.value = "";
							</script>
							<label>일치하는 정보가 존재하지 않습니다.</label>
							</c:if>
							<!-- 일치할때 -->
                        <c:if test="${check == 0 }">
					<label>찾으시는 아이디는'${id}' 입니다.</label>
					<div class="form-label-group">
						<a href="http://localhost/sist/user/index.do" class="btn btn-default" id=""
								style="float: right;">메인으로가기</a>
			</div>
		</c:if>

	</form>
	
	<!-- <script type="text/javascript">
		function closethewindow(){
			location.href="http://localhost/sist/user/user_index.do";
		}
	</script> -->

                    </div>
                </div>
            
</div>
</div>

        
        
        <!-- /.footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="">
                        <div class="col-md-4 col-sm-6">
                            <h4>고객 센터</h4>
                            <p><strong>3조</strong>
                                <br>전화 번호 :081) 123-1234  
                                <br>상담 가능 시간: AM 10:00~PM 05:00
                                <br>관련 이메일: exhibition@naver.com
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
                                    
                                    <div class="clear"> </div>
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
        <!-- <script type="text/javascript">
         $(function(){
        	$("#findid").click(function() {
        		var name=$("#name").val();
        		var tel=$("#tel").val();
				if(name==""){
					alert("이름을 입력해주세요.");
					return;
				}
				if(tel==""){
					alert("휴대폰번호를 입력해주세요.");
					return;
				}
			$("#frm").submit();	
			});
        	
        }); 
        </script> -->

    </body>
</html>