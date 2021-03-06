<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<title></title>

	<link rel="stylesheet" href="/resources/css/blogList.css">
	<script src="/resources/js/blogList.js"></script>
</head>

<body>
<div id="container">
	<div class="wrap">
		<div class="bl_title"><p>论坛</p></div>

		<div id="bl_table">
			<ul>
				<c:forEach items="${noteList}" var="Note" begin="${0}" end="${sessionScope.noteCount}">
				<li class="bl_table_title">
					<div class="bl_container"><a href="/bloglist/bljump/${Note.noteid}" target="_blank">
						<div class="bl_con_title"><p>${Note.title}</p></div>
						<div class="bl_con_favor"><p>收藏${Note.collectedtimes}</p></div>
						<div class="bl_con_comment"><p>评论${Note.commentCount}</p></div></a>
					</div>
				</li>
				</c:forEach>

			</ul>


		</div>
		<div id="bl_addmore" onclick="bl_addmoreclick()"></div>
	</div>
</div>
</body>
</html>
