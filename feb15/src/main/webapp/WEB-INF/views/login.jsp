<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trinity Company - 로그인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="apple-touch-icon" sizes="57x57" href="assets/apple-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="assets/apple-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="assets/apple-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="assets/apple-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="assets/apple-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="assets/apple-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="assets/apple-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="assets/apple-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="assets/apple-icon-180x180.png">
		<link rel="icon" type="image/png" sizes="192x192"  href="assets/android-icon-192x192.png">
		<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="96x96" href="assets/favicon-96x96.png">
		<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon-16x16.png">
		<link rel="manifest" href="assets/manifest.json">
		<meta name="msapplication-TileColor" content="#ffffff">
		<meta name="msapplication-TileImage" content="assets/ms-icon-144x144.png">
		<meta name="theme-color" content="#ffffff">
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- jquery 넣어주세요 -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <script type="text/javascript">
        $(function(){
        	//cookie가져오기 = getCookie
        	let userInputId = getCookie('userInputId');
        	let setCookieYN = getCookie('setCookieYN');
        	
        	if(setCookieYN == 'Y'){
		        $('#id').val(userInputId);
    			$('#saveID').prop("checked", true);    		
        	}
        	
        	//alert("구동하려면 제이쿼리가 필요합니다");
        	//아이디칸, pw칸 검사
        	$('.check').click(function(){
        		let id = $('#id').val();
        		let pw = $('#pw').val();
        		if(id == '' || id.length < 3){
        			Swal.fire("", "올바른 아이디를 입력하세요.","warning");
        			//alert('아이디 문제');
        			$('#id').focus();
        			return false;
        		}
        		if(pw == '' || pw.length < 3){
        			Swal.fire("", "올바른 비밀번호를 입력하세요.","warning");
        			//alert('비밀번호 문제');
        			$('#pw').focus();
        			return false;
        		}
        		//쿠키에 id저장하기
        		//if문으로 사용자가 아이디 저장 눌렀어?
        		if($('#saveID').is(':checked')){
        			//ID불러와서 저장하기
        			setCookie('setCookieYN', 'Y', 60); // 아이디 저장을 클릭했는지 저장합니다.
        			setCookie("userInputId", id, 60);  //쿠키 저장하는 함수
        		} else {
        			//사용자가 id 저장을 누르지 않음. = 저장 안 함.
        			delCookie('userInputId');
        			delCookie('setCookieYN');
        		}
        				
        		$('#loginForm').submit();//form 실행
        	});
        });
        
        //쿠키 저장하는 함수 (쿠키이름, 값, 기한)
        function setCookie(cookieName, value, exdays){
        	//오늘 날짜 뽑기
        	let date = new Date();
        	date.setDate(date.getDate() + exdays);
        	let value2 = escape(value) + "; expires=" + date.toGMTString();
        	//escape() 아스키문자에 해당하지 않는 문자들은 모두 유니코드 형식으로 변환
        	document.cookie = cookieName + "=" + value2;
        }
        
        //쿠키값 가져오기(가져올 쿠키 이름)
        function getCookie(cookieName){
        	let x, y;
        	let val = document.cookie.split(';');
        	for(let i = 0; i < val.length; i++){
        		x = val[i].substr(0, val[i].indexOf('='));//저장한 쿠키이름
        		y = val[i].substr(val[i].indexOf('=') + 1);//쿠키 값
        		x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
        		if(x == cookieName){
        			return y;
        		}
        	}
        }
        
        //삭제하기 (삭제할 쿠키 이름)
        function delCookie(cookieName){
        	//let date = new Date();
        	//date.setDate(date.getDate() - 1);
        	//document.cookie = cookieName + "=; expires="+date.toGMTString();
        	document.cookie = cookieName + "=; max-age=0";//꼭!
        }
        
        </script>
        
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <%@ include file="menu.jsp" %>
        
        <!-- login-->
        <section class="page-section" id="login">
            <div class="d-flex justify-content-center">
               <div class="text-center">
               		<form action="./login" method="post" id="loginForm">
					<img alt="login" src="./img/login.png" width="250px;">
					<div class="mb-3 row">
						<label for="id" class="col-sm-3 col-form-label">I D</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요">
						</div>
					</div>
					<div class="mb-2 row">
						<label for="pw" class="col-sm-3 col-form-label">Password</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="pw" id="pw" placeholder="암호를 입력하세요">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-12 text-start">
							<input type="checkbox" class="saveID" id="saveID">
							<label for="saveID">아이디 저장</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-12">
							<a href="./join" class="btn btn-secondary">회원가입</a>
							<button type="reset" class="btn btn-danger">초기화</button>
							<button type="button" class="btn btn-primary check">로그인</button>
						</div>
					</div>
					</form>
					
            	</div>
            </div>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
		<!-- 파라미터로 오는 error가 있다면 에러 화면에 출력하기     -->    
		<c:if test="${param.error ne null}">
			<script type="text/javascript">
				Swal.fire("Oooops!","잘못된 접근입니다.", "error");
			</script>
		</c:if>
		<c:if test="${param.login ne null }">
			<script type="text/javascript">
				Swal.fire("로그인 할 수 없습니다","올바른 아이디와 비밀번호를 입력하세요.", "error");
			</script>
		</c:if>
		<c:if test="${param.count ne null }">
			<script type="text/javascript">
				let count = ${param.count};
				if(count < 5){
					Swal.fire("로그인 정보를 확인하세요", count + "번 시도했습니다.","warning"); 
				} else {
					Swal.fire("로그인 불가",
						"로그인을 여러번 시도했습니다. 해당 ID는 잠금처리되었습니다. 관리자에게 문의하십시오.",
						"warning");					
				}
			</script>
		</c:if>		
		
    </body>
</html>
