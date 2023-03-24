<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 - ${detail.title }</title>
<link rel="stylesheet" href="../css/crud.css">
<script type="text/javascript">
	function del() {
		 if (confirm("정말 게시글을 삭제하시겠습니까???") == true){
		      document.form.submit();
		  }else{
		      return false;
		  }
		window.location.href="/deleteSuccess.jsp";
	}
</script>

<c:set var="detail" value="${detail}" />
<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
		<div class="box-wrapper">
			<h2 class="title">
				<span class="title-word title-word-1">${detail.bno}</span>
			    <span class="title-word title-word-2">번</span>
			    <span class="title-word title-word-3">째</span>
			    &nbsp;
			    <span class="title-word title-word-4">공</span>
			    <span class="title-word title-word-5">지</span>
			    <span class="title-word title-word-6">사</span>
			    <span class="title-word title-word-6">항</span>
			</h2>
			<table class="table table-striped">
				<tr>
					<th>제목 : </th>
					<td><input class="form-control" id="title_box" type="text" name="title" value="${detail.title}" readonly></td>
					<th>이름 : </th>
					<td><input class="form-control" id="writer_box" type="text" name="writer" value="${detail.writer}" readonly></td>
				</tr>
				<tr>
					<th>내용 : </th>
					<td colspan="3"><textarea class="form-control" id="content_box" name="content" rows="20" cols="30" readonly>${detail.content}</textarea></td>
				</tr>
			</table>
			<div class="btnForm">	
				<form action="/board/list.do">
					<button class="btn btn-primary" type="submit" >목록으로</button>
				</form>
				
				<form action="/modify.do">
				<input class="form-control" id="title_box" type="hidden" name="bno" value="${detail.bno}" readonly>
					<button class="btn btn-success" type="submit" >게시글 수정</button>
				</form>
					<form action="/delete.do" method="post" onsubmit="return del()">
						<button class="btn btn-danger" type="submit">게시글 삭제</button>
					</form>
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>