<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 등록</title>
<c:set var="data" value="${boardList.content}" />
<link rel="stylesheet" href="../css/common.css">
<script>
	alert( '${param.title}글이 작성되었습니다!' );
	location.href="/board/list.do"
</script>
</head>
<body>
	
</body>
</html>