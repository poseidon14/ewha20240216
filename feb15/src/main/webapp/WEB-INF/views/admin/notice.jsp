<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="head.jsp"/>
    <script type="text/javascript">
  	//전자정부 페이징 이동하는 스크립트
    function linkPage(pageNo){location.href = "./notice?perPage=${perPage}&search=${search}&pageNo="+pageNo;}
    function detail(no){var popup = window.open('./detail?no='+no, '톺아보기', 'width=800px, height=800px, scrollbars=yes');}
  	
  	$(function(){
  		//alert($('#perPage').val());
  		$('#perPage').change(function(){location.href="./notice?perPage="+$('#perPage').val()+"&search=${search}&pageNo=${pageNo}";});
  		$("#searchBtn").click(function(){location.href="./notice?perPage=${perPage}&search="+$('#search').val()+"&pageNo=${pageNo}";});
  		$("#clear").click(function(){location.href="./notice?perPage=1&search=&pageNo=1";});
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
                <!-- 검색 -->
				<div class="mb-2 bg-secondery text-right row">
				<div class="input-group col-3">
					<select name="perPage" id="perPage" class="form-control">
	                    <option value="1" <c:if test="${perPage eq 1}">selected="selected"</c:if>>10개씩 보기</option>
	                    <option value="2" <c:if test="${perPage eq 2}">selected="selected"</c:if>>20개씩 보기</option>
	                    <option value="3" <c:if test="${perPage eq 3}">selected="selected"</c:if>>30개씩 보기</option>
	                    <option value="4" <c:if test="${perPage eq 4}">selected="selected"</c:if>>40개씩 보기</option>
	                    <option value="5" <c:if test="${perPage eq 5}">selected="selected"</c:if>>50개씩 보기</option>
	                    <option value="10" <c:if test="${perPage eq 10}">selected="selected"</c:if>>100개씩 보기</option>
					</select>
				</div>
               <div class="input-group col-6">
					<input type="text" class="form-control" name="search" id="search" aria-describedby="searchBtn">
					<button type="button" class="btn btn-outline-secondary" id="searchBtn" >검색</button>
				</div>
				 <button type="button" class="btn btn-secondary col-3" id="clear">초기화</button>
               </div>
				<table class="table table-hover">
					<thead>
						<tr class="row">
							<th class="col-2">번호</th>
							<th class="col-5">제목</th>
							<th class="col-2">날짜</th>
							<th class="col-2">읽음</th>
							<th class="col-1">삭제여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr class="row">
								<td class="col-2" onclick="detail(${row.nno })">${row.nno }</td>
								<td class="title col-5" onclick="detail(${row.nno })">${row.ntitle }</td>
								<td class="col-2">${row.ndate }</td>
								<td class="col-2">${row.nread }</td>
								<td class="col-1">${row.ndel }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 -->
				<div class="m-2 text-secondary text-center">
					<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage"/>
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