<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Board Content</title>
<script type="text/javascript">

$(function(){
	$.ajax({
		type:	"POST",
		url:	"/detailContent",
		data:{
			no: ${no},
			writer: '${writer}'
		},
		success:function(data) {
			$('#writer').text(data.writer);
			$('#title').text(data.title);
			$('#like').text(data.likeCount);
			$('#contents').text(data.contents);
		}
	});
});
function goUpdate(){
	location.hash = "/update?no=" + ${no};
	location.href = "/update?no=" + ${no};
}
function goLike(){
	
}
</script>
</head>
<body>
	<h2 style="text-align: center;">글 내용</h2><br><br><br>

	<div style="width: 60%; margin: auto;">
		<table border='1'>
			<tr>
				<td><b>작성자 </b></td><td id="writer"></td>
			</tr>
			<tr>
				<td><b>제목 </b></td><td id="title"></td>
			</tr>
			<tr>
				<td><b>좋아요 </b></td><td id="like"></td>
			</tr>
			<tr>
				<td><b>글 내용 </b></td><td style="width: 200%; height: 250px;" id="contents"></td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2">
					<input id="likeBtn" type="button" value="좋아요" onclick="goLike();"/>
					<input id="subBtn" type="button" value="글 목록" style="float: right;" onclick="location.href='/'"/>
				<c:if test="${member.accountId != null}">
					<input id="subBtn" type="button" value="글 수정" style="float: right;" onclick="goUpdate()"/>
				</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>