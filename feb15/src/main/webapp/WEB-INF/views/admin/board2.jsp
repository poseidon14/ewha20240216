<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="head.jsp"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript">
    function linkPage(pageNo){
    	location.href = "./board?pageNo="+pageNo+"&perPage=${perPage}&search=${search}";
    }
    
    function postDel(no){
    	location.href="./postDel?no="+no;	
    }
    $(function(){
    	$('#perPage').change(function(){
    		location.href="./board?pageNo=1&perPage="+$('#perPage').val()+"&search=${search}";
    	});
    	$('#searchBtn').click(function(){
    		location.href="./board?pageNo=1&perPage=${perPage}&searchTitle="+$('#searchTitle').val()+"&search="+$('#search').val();
    	});
    	$('#reset').click(function(){
    		location.href="./board";
    	});
    });
    </script>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <jsp:include page="menu.jsp"/>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="header.jsp"/>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="m-2 row">
                    	<select name="perPage" id="perPage" class="form-control col-2">
                    		<option value="1" <c:if test="${perPage eq 1 }">selected="selected"</c:if>>10개씩 보기</option>
                    		<option value="2" <c:if test="${perPage eq 2 }">selected="selected"</c:if>>20개씩 보기</option>
                    		<option value="3" <c:if test="${perPage eq 3 }">selected="selected"</c:if>>30개씩 보기</option>
                    		<option value="4" <c:if test="${perPage eq 4 }">selected="selected"</c:if>>40개씩 보기</option>
                    		<option value="5" <c:if test="${perPage eq 5 }">selected="selected"</c:if>>50개씩 보기</option>
                    		<option value="10" <c:if test="${perPage eq 10 }">selected="selected"</c:if>>100개씩 보기</option>
                    	</select>
                    	<div class="input-group col-6">
                    		<select name="searchTitle" id="searchTitle" class="form-control col-3">
                    			<option value="1" <c:if test="${searchTitle eq 1 }">selected="selected"</c:if>>제목 검색</option>
                    			<option value="2" <c:if test="${searchTitle eq 2 }">selected="selected"</c:if>>본문 검색</option>
                    			<option value="3" <c:if test="${searchTitle eq 3 }">selected="selected"</c:if>>작성자 검색</option>
                    		</select>
	                    	<input type="text" name="search" id="search" class="form-control" value="${search }">
    	                	<button type="button" class="btn btn-secondary" id="searchBtn"><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
                    	</div>
                    	<button type="button" id="reset" class="btn btn-success col-4"><i class="fa fa-refresh" aria-hidden="true"></i> 초기화</button>
                    </div>
					<table class="table table-hover">
					<thead>
						<tr class="row">
							<th class="col-1 text-center">번호</th>
							<th class="col-4 text-center">제목</th>
							<th class="col-2 text-center">글쓴이</th>
							<th class="col-3 text-center">날짜</th>
							<th class="col-1 text-center">읽음</th>
							<th class="col-1 text-center">보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr class="row<c:if test="${row.board_del eq 0}"> bg-dark</c:if>"">
								<td class="col-1 text-center">${row.board_no }</td>
								<td class="col-4">${row.board_title }</td>
								<td class="col-2"><a href="./board?searchTitle=3&search=${row.mname }">${row.mname }</a></td>
								<td class="col-3 text-center">${row.board_date }</td>
								<td class="col-1 text-center">${row.board_count }</td>
								<td class="col-1 text-center">
								<c:choose>
									<c:when test="${row.board_del eq 1 }">
										<i class="fa fa-eye" aria-hidden="true" onclick="postDel(${row.board_no })"></i>
									</c:when>
									<c:otherwise>
										<i class="fa fa-eye-slash" aria-hidden="true" onclick="postDel(${row.board_no })"></i>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="m-2 text-center">
					<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
				</div>
				
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="footer.jsp"/>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>