<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SelfIntroduction</title>
<meta name="description" content="自己紹介">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="icon" type="image/png" href="images/favicon.png" />
</head>
<body>
	<div id="home" class="big-bg">

		<!-- ヘッダー -->
		<header class="page-header wrapper">
			<h1>
				<a href="main.jsp"><img class="logo"
					src="images/header-logo.png" alt="maronanaホーム" />Hello JPIN</a>
			</h1>
			<nav>
				<ul class="main-nav">
					<li><a href="main.jsp">Home</a></li>
					<li><a href="main.jsp">Profile</a></li>
					<li><a href="#bbs">BBS</a></li>
					<li><a href="https://twitter.com/kagoshimasound">Contact</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<!-- メイン -->
	<div id="main" class="wrapper">
		<!-- 左の箱 -->
		<div class="left-box">
			<div class="img-container">
				<span class="tape">Maronana</span> <img src="images/maronanaimg.png"
					class="maronana" /> <span class="tape-end">webライター</span>
			</div>
		</div>
		<!-- 右の箱 -->
		<div class="right-box">
			<div class="memo-container">
				<div class="memo hobby">
					<span class="masking-tape">Hobby </span>
					<ul>
						<li>手帳</li>
						<li>パン作り</li>
						<li>ピアノ</li>
					</ul>
				</div>
				<div class="memo food">
					<span class="masking-tape">Favorite Food </span>
					<ul>
						<li>パン</li>
						<li>煮魚</li>
						<li>枝豆</li>
					</ul>
				</div>
				<div class="memo resolution">
					<span class="masking-tape">New Year's Resolution </span>
					<ul>
						<li>Java Gold</li>
						<li>アプリ開発</li>
						<li>ベビースイミング始める</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
	<div id="#bbs" class="sled-container">
		<h2>- 掲示板 -</h2>
	</div>
	<div id="bulletin-board" class="container kokuban d-flex">

		<div class="cardContainer">

			<c:forEach items="${ sessionScope.list }" var="msg"
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
					<div class="d-flex replycontainer">
						<form method="post" action="reply" class="reply d-flex">
							<input type="hidden" name="id" value="${ msg.id }">
							<input type="submit" value="${ msg.id } に返信する" />



						</form>
						<div class="button">
							<a href="delete?id=${ msg.id }">delete</a>
						</div>
					</div>
				</div>


			</c:forEach>
		</div>
		<div class="form-container box1 d-flex">
			<span class="box-title">メッセージを送信する</span>
			<form action="message" method="post">
				<div class="d-flex labels">
					<label>名 前 <input type="text" name="name"></label> <label>メッセージ
						<input type="text" name="message" required>
					</label> <label> <input type="submit" value="送信" /></label>
				</div>

			</form>

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