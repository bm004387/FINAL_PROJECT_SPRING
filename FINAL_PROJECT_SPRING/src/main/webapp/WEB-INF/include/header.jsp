<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/header.css">

<script src="/js/bootstrap.bundle.js"></script>

<!-- Channel Plugin Scripts -->
<script>
   (function() {
      var w = window;
      if (w.ChannelIO) {
         return (window.console.error || window.console.log || function() {
         })('ChannelIO script included twice.');
      }
      var ch = function() {
         ch.c(arguments);
      };
      ch.q = [];
      ch.c = function(args) {
         ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
         if (w.ChannelIOInitialized) {
            return;
         }
         w.ChannelIOInitialized = true;
         var s = document.createElement('script');
         s.type = 'text/javascript';
         s.async = true;
         s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
         s.charset = 'UTF-8';
         var x = document.getElementsByTagName('script')[0];
         x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === 'complete') {
         l();
      } else if (window.attachEvent) {
         window.attachEvent('onload', l);
      } else {
         window.addEventListener('DOMContentLoaded', l, false);
         window.addEventListener('load', l, false);
      }
   })();
   ChannelIO('boot', {
      "pluginKey" : "634ebfd4-9412-4ee3-89a8-ca5bac58fa25"
   });
</script>
<!-- End Channel Plugin -->
</head>
<body>
<div class="container">
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid hdnav">
	    <a class="navbar-brand logo" href="/main.do"><img src="/images/logo1.png"/></a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav" style="width: 100%; background: lightblue;">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" href="/about.do">회사소개</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/faq.do">FAQ</a>
	        </li>
	          <li class="nav-item">
	           <a class="nav-link active" href="/location.do">찾아오시는길</a>
	        </li>
	         <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/board.do">공지사항</a></li>
	            <li><a class="dropdown-item" href="/react.do">홍보게시판</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li>
			<c:if test="${resultVO != null }">
				<li class="dropdown">
					<a class="dropdown-toggle"data-bs-toggle="dropdown" aria-expanded="false">여행 상품 메뉴 </a>
					<form id="pay" name="pay" method="post" action="tourpaylist.do">
						<input type="hidden" name="memberid" value=${resultVO.memberId}>
						</form>
					<form id="cart" name="cart" method="post" action="tourcartlist.do">
						<input type="hidden" name="memberid" value=${resultVO.memberId}>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="tourList.do">여행 상품 목록</a></li>
								<li><button id ="cartlistBtn" form="cart" type="submit" class="" >카트리스트</button></li>
								<li><button id ="paylistBtn" form="pay" type="submit" class="" >결제리스트</button></li>
								<c:if test="${resultVO.memberId=='admin'}">
									<li><a class="dropdown-item" href="api.do">데이터 업데이트</a></li>
								</c:if>
						 	</ul>
					</form>
				</li>
			</c:if>
		</ul>
		<ul class="nav justify-content-end loginForm">
		  	<li class="nav-item">
		  	<c:if test="${resultVO == null}">
		    	<a class="nav-link active" aria-current="page" href="/login.do">로그인</a>
		   	</c:if>
		    <c:if test="${resultVO != null}">
		    	<a class="nav-link active" aria-current="page" href="/logout.do">로그아웃</a>
		   	</c:if>
		  	</li>
		</ul>
	    </div>
	  </div>
	</nav>
</div>