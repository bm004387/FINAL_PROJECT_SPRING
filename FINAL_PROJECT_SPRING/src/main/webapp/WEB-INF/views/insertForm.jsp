<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/crud.css">

<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<title>게시글 등록</title>
<c:set var="data" value="${boardList.content}" />
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<script type="text/javascript">
function chkBoard(){
	  if (confirm("게시글을 작성하시겠습니까???") == true){
	      document.form.submit();
	  }else{
	      return false;
	  }
	}

$(document).ready(function(){
	$("#submit").click(function(){
		if($("#title_box").val().length == 0){
			alert("제목을 입력하세요")
			$("#title_box").focus();
			return false;
		};
		if($("#writer_box").val().length == 0){
			alert("이름을 입력하세요")
			$("#writer_box").focus();
			return false;
		};
		if($("#content_box").val().length == 0){
			alert("내용을 입력하세요")
			$("#content_box").focus();
			return false;
		};
		
	});
});
</script>
<body>
	<div class="container">
		<div class="box-wrapper">
		<h2 class="title">
			<span class="title-word title-word-1">게</span>
		    <span class="title-word title-word-2">시</span>
		    <span class="title-word title-word-3">글</span>
		    <span class="title-word title-word-4">작</span>
		    <span class="title-word title-word-5">성</span>
		</h2>
		<form action="write.do" method="post" name="insertForm" onsubmit="return chkBoard()">	   		
			<table class="table table-striped">
				<tr>
					<th>제목 : </th>
					<td><input class="form-control" id="title_box" type="text" name="title" value="${param.title}" required></td>
					<th>이름 : </th>
					<td><input class="form-control" id="writer_box" type="text" name="writer" value="${param.writer}" required></td>
				</tr>
				<tr>
					<th>내용 : </th>
					<td colspan="3"><textarea class="form-control" id="content_box" name="content" rows="20" cols="30" required>${param.content}</textarea></td>
				</tr>
			</table>
				<div class="btnForm">
					<button class="btn btn-primary" id="submit" type="submit" value="게시글 등록" >게시글 등록</button>
					<button class="btn btn-danger" type="button" onclick="javascript:history.go(-1);">취소</button>
				</div>								
			</form>
			
		</div>	
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>