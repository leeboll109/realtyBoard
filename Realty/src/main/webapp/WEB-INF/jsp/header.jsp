<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function goLogin(frm){
	var accountId = frm.accountId.value;
	var accountPw = frm.accountPw.value;
	
	if (accountId.trim() == ''){
		alert("ID을 입력해주세요");
		return false;
	}
	if (accountPw.trim() == ''){
		alert("PW를 입력해주세요");
		return false;
	}
	frm.submit();
}
function goLogout(frm){
	location.href = "/logout";
}
</script>
</head>
<body>
<div style="width: 60%; margin: auto;">
	<form action="/login" method="post">
	<table>
		<c:if test="${member.accountId == null}">
		<tr>
			<td align="right">
				<b>ID : </b>
			</td>
			<td><input type="text" id="accountId" name="accountId"/></td>
		</tr> 
		<tr>
			<td align="right">
				<b>PW : </b>
			</td>
			<td><input type="password" id="accountPw" name="accountPw"/></td>
			<td rowspan="2"><input type="button" id="loginBtn" value="로그인" onclick="goLogin(this.form)"/></td>
		</tr>
		</c:if>
	</table>
	</form>
	<c:if test="${member.accountId != null}">
	<table>
		<tr>
			<td>nickname : </td><td>${member.nickname}</td>
		</tr>
		<tr>
			<td>type : </td><td>${member.accountType}</td>
			<td rowspan="2" align="right"><input type="button" id="logoutBtn" value="로그아웃" onclick="goLogout(this.form)"/></td>
		</tr>
	</table>
	</c:if>
</div>
</body>
</html>