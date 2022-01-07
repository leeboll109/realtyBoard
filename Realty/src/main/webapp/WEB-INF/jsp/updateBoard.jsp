<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Board Update</title>
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
			$('#nickname').text(data.writer);
			$('#title').val(data.title);
			$('#contents').val(data.contents);
		}
	});
});
function goUpdate(frm){
	var title = frm.title.value;
	var contents = frm.contents.value;
	frm.no.value = ${no};
	frm.writer.value = '${writer}';
	
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
	<h2 style="text-align: center;">글 내용</h2><br><br><br>

	<div style="width: 60%; margin: auto;">
		<form method="post" action="/updateContent" enctype="application/json">
			<input type="hidden" id="no" name="no"/>
			<input type="hidden" id="writer" name="writer"/>
			<table border='1'>
				<tr>
					<td><b>작성자 </b></td><td id="nickname"></td>
				</tr>
				<tr>
					<td><b>제목 </b></td><td style="width: 100%;"><input type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<td><b>글 내용 </b></td><td><textarea style="width: 98%; height: 250px;" id="contents" name="contents"></textarea></td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="2">
						<input id="subBtn" type="button" value="글 목록" style="float: right;" onclick="location.href='/'"/>
						<input id="subBtn" type="button" value="글 수정" style="float: right;" onclick="goUpdate(this.form)"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>