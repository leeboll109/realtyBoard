<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Main Board</title>
<script type="text/javascript">
$(function(){
	
});

function goDetail(no){
	location.hash = "/";
	location.href = "/detail?no=" + no;
}

function goDelete(contentNo, contentWriter){
	$.ajax({
		type:	"post",
		url:	"/delete",
		data:	{
			no : contentNo,
			writer : contentWriter
			
		},
		success: function() {
			location.reload();
		}
	})
}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div style="width: 60%; margin: auto;">
		<table>
			<tr>
				<td><b>글 목록</b></td>
				<c:if test="${member.accountId != null}">
					<td align="right">
						<a href="/new?writer=${member.nickname}">글쓰기</a>
					</td>
				</c:if>
			</tr>
		</table>
		<table border="2" id="table1">
			<tr>
				<th width="60">번호</th>
				<th width="260">제목</th>
				<th width="100">작성자</th>
				<th width="150">작성일</th>
				<th width="60">좋아요</th>
				<th width="60">조회</th>
				<th width="60">삭제</th>
			</tr>
			<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.no}</td>
				<td onclick="goDetail(${list.no})" style="cursor:pointer;">${list.title}</td>
				<td>${list.writer}</td>
				<td>${list.writeTime}</td>
				<td>${list.likeCount}</td>
				<td>${list.viewCount}</td>
				<td><input type="button" id="deleteBtn" value="삭제" onclick="goDelete(${list.no}, '${list.writer}')"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div style="display: block; text-align: center;" id="pagination">	
		<c:if test="${page.startPage != 1}">
			<a href="/?page=${page.startPage - 1}">&gt;</a>
		</c:if>	
		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
			<c:choose>
				<c:when test="${page.nowPage == i}">
					<b>${i}</b>
				</c:when>
				<c:otherwise>
					<a href="/?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.endPage != page.lastPage}">
			<a href="/?page=${page.endPage + 1}">&gt;</a>
		</c:if>	
	</div>
</body>
</html>