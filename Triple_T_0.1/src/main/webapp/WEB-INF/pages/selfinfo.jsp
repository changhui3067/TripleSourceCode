<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="/resources/css/selfinfo.css">
	<link rel="stylesheet" href="/resources/css/base.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/clearfix.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.fancybox-1.3.1.css" media="screen">
	<link rel="stylesheet" type="text/css" href="/resources/css/dark.css">

	<script src="/resources/js/index.js"></script>
	<script src="/resources/js/base.js"></script>
	<script src="/resources/js/selfinfo.js"></script>
	<script src="/resources/js/jquery-1.2.6.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function($){
			$(".exit").click(function(){
//				var flag = getCookie("flag");
//				if(flag!="true"){
//					location.reload(true);
//				}else {
					deleteCookie("flag");
					location.href = "/logout";
				//}
			})
		});
		function checkImage(){
			var oInput = document.getElementById("imgfile").value;
			if(oInput==""){
				alert("你尚未选择图片!!");
				location.reload(true);
				return false;
			}
			else{
				document.forms["headImage"].submit();
			}
		}
	</script>
</head>
<body>

<div id="header" class="clearfix">

	<div class="holder clearfix">

		<div class="skipLink"><a href="#content" title="Skip to content">Skip to content</a></div>

		<div id="title"><span><a href="/" title="返回首页" rel="home"></a></span></div>
		<ul id="siteNav">
			<%--<li><a class="exit" href="javascript:;" style="text-decoration:none"><span>退出</span></a></li>--%>
			<li><a href="/" style="text-decoration:none"><span>返回</span></a></li>
		</ul>

	</div>

</div><!-- #header -->
<div class="outer">
	<div class="wrap">
		<div id="header-nav">
		<div id="nav-title" name=""><span>用户 详细信息</span></div>
	</div>
		<div id="content">
		<div class="selfinfo1">
			<form name="headImage" method="post" action="/upload" enctype="multipart/form-data">
		<div id="localImag"><img id="preview" style="width:150px;height:180px;" src="/resources/headImage/${user.headimage}"></div>
		<div class="uploadandsubmit">
				<div class="uploadsubmit">
			<a href="javascript:;" class="a-upload"><input type="file" name="file" id="imgfile" style="width:150px;" onchange="javascript:setImagePreview();"><span>选择文件</span></a>
		</div>
				<div class="uploadButton">
				<input type="submit" value="上传" onclick="checkImage()"/>
					</div>
			</div>
				</form>

				<div class="selfdata">
			<p><a id="bi" onclick="changeoption1()">基本资料</a></p>
			<p><a id="ct" onclick="changeoption2()">收藏的帖子</a></p>
			<p><a id="cs" onclick="changeoption3()">收藏的学校</a></p>
			<p><a id="mt" onclick="changeoption4()">我的帖子</a></p>
			<p><a id="wt" onclick="changeoption5()">我要发帖</a></p>
		</div>
	</div>
		<div class="showinfo">
		<div id="selfinfo2">
			<div class="layer">
				<div class="mylabel">
					<label>用户名:</label>
				</div>
				<div class="slide_input">
					<input type="text" id="S_username" name="username" value="${user.username}" disabled/>
					<!-- <p><c:out value=""></c:out></p> -->
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<label>性别:</label>
				</div>
				<div class="slide_input">
					<select id="s_sex">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<label>邮箱:</label>
				</div>
				<div class="slide_input">
					<input type="text" id="S_email" name="mailbox" value="${user.emailaddress}" disabled/><br/>
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<label>本科学校:</label>
				</div>
				<div class="slide_input">
					<input type="text" id="S_gschool" name="gradschool" value="${user.schoolName}" disabled/><br/>
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<label>本科专业:</label>
				</div>
				<div class="slide_input">
					<%--<input type="text" id="S_gsubject" name="gradschool" value="请输入专业名称" disabled/><br/>--%>
						<select id="S_gsubject" >
							<c:if test="${user.gsub==null}">
								<c:out value="请选择专业"></c:out>
							</c:if>
							<c:if test="${user.gsub!=null}">
								<option>${user.gsub}</option>a
							</c:if>
							<option>商科和管理</option>
							<option>基础科学</option>
							<option>工程类</option>
							<option>法律</option>
							<option>教育和教学</option>
							<option>传媒</option>
							<option>建筑</option>
							<option>设计</option>
						</select>
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<%--<label>分数:</label>--%>
					<select id="s_gradetype">
						<option>托福</option>
						<option>雅思</option>
					</select>
				</div>
				<div class="slide_input">
					<input type="text" id="S_grade" name="grade" value="${user.score}" disabled/><br/>
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<label>GPA:</label>
				</div>
				<div class="slide_input">
					<input type="text" id="S_gpa" name="gpa" value="${user.gpa}" disabled/><br/>
				</div>
			</div>
			<div class="layer">
				<div class="mylabel">
					<label>GRE:</label>
				</div>
				<div class="slide_input">
					<input type="text" id="S_gre" name="gre" value="${user.grescore}" disabled/><br/>
				</div>
			</div>
			<div id="messagebutton">
				<div class="modifybutton">
					<button type="submit" tabindex="5" onclick="modify()">修改</button>
				</div>
				<div class="savebutton">
					<button type="submit" tabindex="5" onclick="sendmessage()">保存</button>
				</div>
			</div>
		</div>

		<div id="collecttalk" style="display:none;">
			<h2>收藏的帖子</h2>
			<div class="talk">
				<ul>
					<c:forEach items="${noteList}" var="Favourites" begin="0" end="9">
						<li>
							<div class="notelist">
								<a  href="/bloglist/bljump/${Favourites.noteId}">
									<div class="aDiv">${Favourites.noteTitle}</div>
            						<div class="spanDiv"><fmt:formatDate value='${Favourites.pushDate}' pattern='yyyy-MM-dd HH:mm:ss'/></div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="dividePage">
				<ul class="pagination">
					<li><a href="#">上一页</a></li>
					<li class="selected"><a href="#">下一页</a></li>

				</ul>
			</div>
		</div>

		<div id="mytalk" style="display:none;">
		<h2>我的帖子</h2>
		<div class="talk">
			<ul>
				<c:forEach items="${myNotes}" var="Note" begin="0" end="9">
					<li>
						<div class="notelist">
							<a href="/bloglist/bljump/${Note.noteid}">
							<div class="aDiv">
							${Note.title}
								</div>
								<div class="spanDiv">
									<fmt:formatDate value='${Note.pushdate}' pattern='yyyy-MM-dd HH:mm:ss'/>
								</div>
							</a>
							<span>
            				<td></td>
         				 	</span>
							</div>
					</li>
				</c:forEach>
			</ul>
		</div>
			<div class="dividePage">
				<ul class="pagination">
					<li><a href="#">上一页</a></li>
					<li class="selected"><a href="#">下一页</a></li>

				</ul>
			</div>
	</div>
		<div id="collectschool" style="display:none;">
			<div class="school">
				<h2>收藏的学校</h2>
				<div class="collegelogo">
					<ul>
						<c:forEach items="${schoolList}" var="Favourites" begin="0" end="9">
							<li>
								<a href="/school/${Favourites.schoolId}">
										<img src="/resources/schoolLogo/${Favourites.continent}/${Favourites.schoolLogo}" style="width:40px;height:40px;border:none;float: left;">
										<p style="padding:10px;">${Favourites.schoolName}</p>
								</a>
							</li>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>
		<div id="writecomment" style="display:none;">
			<h2>写帖</h2>

			<input id="notetitle" type="text" name="notetitle" value="标题写在这"/>
			<textarea id="note"  name="notemessage" clos="20" rows="5" style="color: WHITE;padding: 5px 0 5px 5px;">说点什么吧！
			</textarea>
			<div class="submitbutton">
				<button type="submit" tabindex="5" onclick="sendnote()">发布</button>
			</div>

		</div>
	</div>
		</div>
	</div>
	</div>
</body>

</html>