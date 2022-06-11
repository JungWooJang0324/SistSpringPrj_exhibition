<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>


        <!-- /.website title -->
        <title>내정보 수정</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <meta charset="UTF-8" />
        <!-- CSS Files -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet" media="screen">
        <link href="css/owl.theme.css" rel="stylesheet">
        <link href="css/owl.carousel.css" rel="stylesheet">
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">

        <!-- Colors -->
        <!-- <link href="css/css-index-blue.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
        <!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
        <link href="css/css-index-yellow.css" rel="stylesheet" media="screen"> 

        <!-- Google Fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

    </head>
    
       <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#find_addr").click(function(){
		new daum.Postcode({
		    oncomplete: function(data) {
		    	 var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("address1").value = extraAddr;
	                
	                } else {
	                    document.getElementById("address1").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('address1').value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
		    }
		}).open();
	});
	
	$("#next").click(function(){
		var password = $("#password").val();
		var passwordChk = $("#passwordChk").val();
		
		if(password ==''){
			alert("비밀번호를 입력해주세요!");
			return;
		}
		
		if(passwordChk!=''){
			if(passwodChk != password){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
		}
		$("#modifyFrm").submit();
	});//click
});

</script>
	<c:if test="${msg eq 1}">
	<script type="text/javascript">
		alert("수정이 완료되지 못했습니다. 다시한번 시도해 주세요.");
	</script>
	</c:if>
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
                            내정보 수정
                        </h2>

                    </div>
                </div> 
            </div> 
        </div>
        
             <!-- NAVIGATION -->
        <div id="menu">
               <div class="container""> 
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-backyard">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand site-name" href="index.jsp">Exhibition</a>
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
        
        <!-- /.pricing section -->
        <div id="myaccount">
            <div class="container">
                <div class="text-center ">
                    <!-- /.pricing title -->
                    <h2 class="wow fadeInLeft">내 정보</h2>
                    <div class="title-line wow fadeInRight"></div>
                </div>
                <div class="row account-details">

                    <!-- /.account-control -->
                    <div class="col-sm-3 account-control padding-b-50 padding-t-50">
                        <div class="panel panel-default sidebar-menu wow  fadeInLeft animated">
                            <div class="panel-heading">
                                <h3 class="panel-title">Menu</h3>
                            </div>
                            <div class="panel-body">
                                <ul class="nav nav-pills nav-stacked">
                                    <li ><a href="my-account_rez.do">예약상황</a></li>
                                    <li class="active"><a href="my_account_modify.do">내 정보 수정</a></li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
        
<div id="sign-in" style="margin-left: 30%">
            <div class="container">
      
                <div class="col-sm-6"  >
                    
                    <div class="row register">
						
		        	<c:forEach var="memberList" items="${memberList}">
		        	
                        <form action="my_account_modify_process.do" method="post" id="modifyFrm">
                            <div class="form-group">
                                <label for="email-login">이메일</label>
                                <input class="form-control"  type="text" value="${memberList.userId}" id="userId" name="userId" readonly="readonly"><br/>
                            </div>
                            <div class="form-group">
                                <label for="password">비밀번호</label>
                                <input class="form-control"  type="password" id="password" name="password" value="${memberList.password}"><br/>
                                <label for="password">비밀번호 확인</label>
                                <input class="form-control"  type="password" id="passwordChk"><br/>
                            </div>
                            <div class="form-group">
                                <label for="name-login">이름</label>
                                <input class="form-control"  type="text" id="name" name="name" value="${memberList.name }">
                            </div>
                            <div class="form-group">
                                <label for="tel-login">전화번호</label>
                                <input class="form-control"  type="text" id="tel" name="tel" value="${memberList.tel}">
                            </div>
                            <div class="form-group">
                                <label for="addr-login">주소</label>
                                <input class="form-control"  type="text" id="address1" name="address1" value="${memberList.address1 }"/>
                                <input class="form-control"  type="text" id="address2" name="address2" value="${memberList.address2 }"><br/>
                        <input type="button"  class="btn btn-warning btn-block btn-lg" value="우편번호 찾기" id="find_addr">
                            <div class="form-group">
                                <label for="zipcode-login">우편번호</label>
                                <input class="form-control"  type="text" id="zipcode" name="zipcode" value="${memberList.zipcode}">
                            </div>
                           
                            </div>
                                <input type="button"  value="수정" id="next" style="width:260px; background-color: #F0AD4E;color:#ffffff; border:0px">
                                <input type="button" id="modifyBtn"  value="취소" style="width:260px; margin-left: 15px ;background-color: #F0AD4E;color:#ffffff; border:0px">
                        </form>
                            
		        	</c:forEach>
                    </div>
                </div>
          </div>
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
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
            <script src="js/jquery.validate.min.js"></script> 



        <script>
            new WOW().init();

        </script>

    </body>
</html>