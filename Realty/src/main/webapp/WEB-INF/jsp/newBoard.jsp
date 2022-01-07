<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Board Insert</title>
<script>
$(function(){
	var text = '';
	if(${member.accountType == 'lessor'})
		text = '${member.nickname}(임대인)';
	else if(${member.accountType == 'realtor'})
		text = '${member.nickname}(공인중개사)';
	else if(${member.accountType == 'lessee'})
		text = '${member.nickname}(임차인)';

	$('#nickname').text(text);
});
function goWrite(frm){
	var title = frm.title.value;
	frm.writer.value = '${member.nickname}';
	var contents = frm.contents.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (contents.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</head>
<body>
	<h2 style="text-align: center;">글 작성</h2><br><br><br>

	<div style="width: 60%; margin: auto;">
		<form method="post" action="/write">
		<input type="hidden" id="writer" name="writer"/>
		<table border='1'>
			<tr>
				<td><b>작성자 </b></td><td id="nickname"></td>
			</tr>
			<tr>
				<td><b>제목 </b></td><td style="width: 100%;"><input type="text" name="title" placeholder="제목"/></td>
			</tr>
			<tr>
				<td><b>글 내용 </b></td><td><textarea id="contents" name="contents" style="width: 98%; height: 250px;"></textarea></td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2">
					<input id="subBtn" type="button" value="글 목록" style="float: right;" onclick="location.href='/'"/>
					<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>