<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <!-- /.website title -->
        <title>전시 예약</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta charset="UTF-8" />
        <!-- CSS Files -->
        <link href="http://localhost/exhibition_user/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="http://localhost/exhibition_user/css/font-awesome.min.css" rel="stylesheet">
        <link href="http://localhost/exhibition_user/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="http://localhost/exhibition_user/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="http://localhost/exhibition_user/css/animate.css" rel="stylesheet" media="screen">
        <link href="http://localhost/exhibition_user/css/owl.theme.css" rel="stylesheet">
        <link href="http://localhost/exhibition_user/css/owl.carousel.css" rel="stylesheet">
        <link href="http://localhost/exhibition_user/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

        <!-- Colors -->
        <!-- <link href="css/css-index-blue.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
        <link href="http://localhost/exhibition_user/css/css-index-yellow.css" rel="stylesheet" media="screen"> 

        <!-- Google Fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />
		<style type="text/css">
		.txt_line {
			  display: -webkit-box;
      display: -ms-flexbox;
      display: box;
      margin-top:1px;
      max-height:80px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:3
		}
		</style>
    </head>
 
    <body data-spy="scroll" data-target="#navbar-scroll">
        <!-- /.preloader -->
        <div id="preloader"></div>
        <div id="top"></div>

        <!-- /.parallax full screen background image -->
        <div class="fullscreen landing parallax"  >

            <div class="overlay">
                <div class="container" >
                    <div class="row">
                      <div class="col-md-7">

                            <!-- /.logo -->
                            <div class="logo wow fadeInDown">
                                <a href="index.do" style="font-size: xx-large;">Exhibition</a>
                            </div>

                            <!-- /.main title -->
                            <h1 class="wow fadeInLeft">
                                 <span class="color">전시 예약하기</span> 
                            </h1>

                                  
                            <!-- /.header paragraph -->
                            <div class="landing-text wow fadeInUp">
                            <ul style="color:#FFFFFF">
                            <c:forEach var="exInfo" items="${exInfo}">
                                <li><strong><c:out value="${exInfo.ex_name}"/></strong></li>
                                <li><img src="${exInfo.exhibition_poster}" style="width: 40%; align-content: c"/></li>
                                <li class="txt_line">
	                                <c:out value="${exInfo.ex_info}"/>
                                </li>
                            </c:forEach>
                            </ul>
                            </div>		
                            		  
                        </div> 

                        <!-- /.signup form -->
                        <div class="col-md-5">

                            <div class="signup-header wow fadeInUp">
                                <h3 class="form-title text-center">예약</h3>
                                    <div id="booking_control" class="booking_control">
                                   		<form id="chooseExName" action="reservation.do" method="get">
                                           <div class="form-group">
                                            <select class="form-control input-lg" name="ex_num" id="exName">
                                           <c:forEach var="exName" items="${exName}">
                                            <option id="exName" value="${exName.ex_num}" ${(exName.ex_num eq param.ex_num)?"selected='selected'":""}>${exName.ex_name}</option>
                                            </c:forEach>
                                            </select>
                                        </div> 
                                        </form>
                                         
      									  <form action="rezProcess.do" method="POST" id="rezFrm" name="rezFrm">
      									  <input type="hidden" value="test1@test.com" name="userid"/>
      									  <c:forEach var="exName" items="${exName}">
      									  <input type="hidden" value="${exName.ex_num}" name="ex_num"/>
      									  </c:forEach>
      									  <div class="form-group">
      									  <c:forEach var="exInfo" items="${exInfo}">
      									  <input type="hidden" value="${exInfo.deadline}" id="chkDeadline"/>
	      									  <input class="form-control input-lg" type="text" value="${exInfo.ex_loc} / ${exInfo.address1}" readonly="readonly"/>
      									  </c:forEach>
      									  </div>
                                           <div id="date_time" class="form-group">
                                           <input class="form-control input-lg" name="visit_date" class="pick_up_date" id="pick_up_date" type="text" placeholder="방문날짜선택" required>
                                            <a class="add-on btn-geolocation btn-calendar" href="#"><i class="pe-7s-date" style="margin-top: 58px"></i></a>
                                        </div>
                                        <div class="form-group">
										<input class="form-control input-lg" type="number" name="rez_count" value="3" />
                                            
                                        </div>
      									  </form>
                                        <div class="form-group last">
                                         <input type="button" id="rezBtn" class="btn btn-warning btn-block btn-lg" value="예약하기"/>
                                        </div>
                                    </div>
                                    </div>
             
                            </div>				

                        </div>
                    </div>
                </div> 
            </div> 


      
        <!-- NAVIGATION -->
        <div id="menu">
               <div class="container"> 
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-backyard">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand site-name" href="index.do">Exhibition</a>
                    </div>

                    <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right">
                        <ul class="nav navbar-nav">
                             <li><a href="list.do">전체 전시 보기</a></li>
                            <li><a href="loc.do">지역별 전시 보기</a></li>
                            <li><a href="reservation.do">예약하기</a></li>
                                    <li><a href="board.do">게시판</a></li>
                        
                        </ul>
                    </div>
                 </div>  
        </div>
<!-- The Modal -->    
<div id="myModal" class="modal">
       <!-- Modal content -->     
		<div class="modal-content">
		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">공지</span></b></span></p>
		<p style="text-align: center; line-height: 1.5;"><br />여기에 내용</p>
		<p><br/></p>
	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		<span class="pop_bt" style="font-size: 13pt;" > 닫기 </span>
	</div>
	</div>
</div>
        
        <c:if test="${msg eq 1}">
		<script type="text/javascript">
		 jQuery(document).ready(function() {$('#myModal').show(); });        //팝업 Close 기능 
		  function close_pop(flag) { $('#myModal').hide();};
		
		</script>
		</c:if>        
	
	  <!--End Modal-->
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
        <script src="http://localhost/exhibition_user/js/jquery.js"></script>
        <script src="http://localhost/exhibition_user/js/bootstrap.min.js"></script>
        <script src="http://localhost/exhibition_user/js/bootstrap-datetimepicker.min.js" ></script>
        <script src="http://localhost/exhibition_user/js/bootstrap-datetimepicker.kr.js" charset="UTF-8"></script>
        <script src="http://localhost/exhibition_user/js/custom.js"></script>
        <script src="http://localhost/exhibition_user/js/jquery.sticky.js"></script>
        <script src="http://localhost/exhibition_user/js/wow.min.js"></script>
        <script src="http://localhost/exhibition_user/js/owl.carousel.min.js"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
        <script src="http://localhost/exhibition_user/js/google.js"></script> 
        <script src="http://localhost/exhibition_user/js/booking.js"></script> 
        <script src="http://localhost/exhibition_user/js/bootstrap-hover-dropdown.js"></script> 
        <script src="http://localhost/exhibition_user/js/jquery.validate.min.js"></script> 
        <script type="text/javascript" src="http://localhost/exhibition_user/js/ko.js"></script>
        <script src="http://localhost/exhibition_user/js/snap.svg-min.js"></script> 

        <script>
      
        
                                                new WOW().init();
                                                $('#date_time').datetimepicker({
                                                	
                                                    format: 'yyyy-MM-dd ',
                                                    language:'kr',
                                                    todayHighlight : true,
                                                    startDate: new Date(),
                                                    endDate :(new Date($("#deadline").val()))
                                                });
                                               
                                                
                                               
                                                   
        </script>

        <script>
            (function () {
                function init() {
                    var speed = 250,
                            easing = mina.easeinout;
                    [].slice.call(document.querySelectorAll('#carssections > a')).forEach(function (el) {
                        var s = Snap(el.querySelector('svg')), path = s.select('path'),
                                pathConfig = {
                                    from: path.attr('d'),
                                    to: el.getAttribute('data-path-hover')
                                };

                        el.addEventListener('mouseenter', function () {
                            path.animate({'path': pathConfig.to}, speed, easing);
                        });

                        el.addEventListener('mouseleave', function () {
                            path.animate({'path': pathConfig.from}, speed, easing);
                        });
                    });
                }
                init();
            })();
        </script>

<script type="text/javascript">

	$("#exName").on('change',function(){
		var exName= $("#exName").val();
		$("#chooseExName").submit();
	});
	$("#exhibition").on('change',function(){
		$("#exFrm").submit();
	});

	

	$("#rezBtn").click(function(){
	var reser=document.getElementById("pick_up_date").value;
	var chkDeadline = $("#chkDeadline").val();
	if(chkDeadline < reser){
		alert("전시는 "+chkDeadline+"까지입니다. \n다른날을 선택해 주세요");
		return;
	}
	if(reser==""){
		alert("날짜를 선택해주세요.");
		return;
	} 
	
	
   $("#rezFrm").submit();
	});//click
	
</script>


    </body>
</html>