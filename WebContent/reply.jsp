<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/reply.css" />
<link rel="icon" type="image/png" href="images/favicon.png" />
</head>
<body>
	<div>

		<!-- ヘッダー -->
		<header class="page-header wrapper">
			<h1>
				<a href="main.jsp"><img class="logo"
					src="images/header-logo.png" alt="maronanaホーム" />Hello JPIN</a>
			</h1>
			<nav>
				<ul class="main-nav">
					<li><a href="index.html">Home</a></li>
					<li><a href="index.html">Profile</a></li>
					<li><a href="https://twitter.com/kagoshimasound">Contact</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="h2-container d-flex">
		<h2>- 掲示板 -</h2>
	</div>

	<div id="bulletin-board" class="container kokuban d-flex">

		<div class="cardContainer">

			<div class="message-box bg-yellow">

				<h3>
					<c:out value="${ replyMessage.id }" />
					<c:out value="${ replyMessage.name }" />
					<fmt:formatDate value="${ replyMessage.date }" pattern="HH:mm:ss" />
				</h3>
				<div class="message">
					<c:out value="${ replyMessage.message }" />
				</div>

			</div>

		</div>
		<div class="formContainer">
			<div>
				<form action="replylist" method="post">
					<div class="d-flex labels">
						<label>名 前 <input type="text" name="name"></label>
						<textarea name="message" rows="5" cols="30" required>>>${ replyMessage.id }さんに返信</textarea>
						<input type="submit" value="送信" />
					</div>

				</form>
			</div>

		</div>
		<div class="cardContainer">

			<c:forEach items="${ sessionScope.replyList }" var="msg"
				varStatus="status">

				<div
					<c:choose>
					<c:when test="${ status.index % 2 == 0 }">class="message-box bg-yellow"</c:when>
					<c:when test="${ status.index % 2 != 0 }">class="message-box bg-white"</c:when>
				 </c:choose>>
					<h3>
						<c:out value="${ msg.id }" />
						<c:out value="${ msg.name }" />
						<fmt:formatDate value="${ msg.date }" pattern="HH:mm:ss" />
					</h3>

					<div class="message">
						<c:out value="${ msg.message }" />
					</div>

					<%-- <div class="button2">
						<a href="delete?id=${ msg.id }">delete</a>
					</div> --%>

				</div>

			</c:forEach>
		</div>
	</div>
	<!-- フッター -->
	<footer>
		<div class="wrapper">
			<p>
				<small>Copyright(c) 2021 maronana All rights reserved</small>
			</p>
		</div>
	</footer>

</body>
</html>