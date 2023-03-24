<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/crud.css">
<title>게시글 수정 - ${detail.title}</title>
<c:set var="detail" value="${detail}" />
<script type="text/javascript">
	function btn() {
		if (confirm("${detail.title}을 수정하시겠습니까??") == true){
		      document.form.submit();
		  }else{
		      return false;
		  }
// 		alert('${detail.title}글을 수정하시겠습니까?')
	}
</script>
<jsp:include page="../include/header.jsp"></jsp:include>
</head>

<body>
	<div class="container">
		<div class="box-wrapper">
			<h2 class="title">
				<span class="title-word title-word-1">${detail.title}</span>
			    <span class="title-word title-word-2">글</span>
			    &nbsp;
			    <span class="title-word title-word-3">수</span>
			    <span class="title-word title-word-4">정</span>
			</h2>
			<form action="/modifySuccess.do" method="post"  onsubmit="return btn()">
				<table class="table table-striped">
					<tr>
						<th>제목 : </th>
						<td><input class="form-control" id="title_box" type="text" name="title" value="${detail.title}"></td>
						<th>이름 : </th>
						<td><input class="form-control" id="writer_box" type="text" name="writer" value="${detail.writer}"></td>
					</tr>
					<tr>
						<th>내용 : </th>
						<td colspan="3"><textarea class="form-control" id="content_box" name="content" rows="20" cols="30">${detail.content}</textarea></td>
					</tr>
				</table>
				<div class="btnForm">
					<form>
						<button class="btn btn-primary" type="submit">수정하기</button>
					</form>
					<form action="/board/list.do">
						<button class="btn btn-primary"  >목록으로</button>
					</form>
					<button class="btn btn-danger" type="button" onclick="javascript:history.go(-1);">취소</button>				
				</div>	
			</form>		
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>