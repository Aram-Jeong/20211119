<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../home/header.jsp"/>
<div align="center">
	<div><h1>π°κ³΅μ§μ¬ν­ λ±λ‘π₯<h1></div>
	<div>
		<form id="frm" action="noticeResister.do" method="post" enctype="multipart/form-data">
		<div>
			<table border="1">
				<tr>
					<th width="150">μμ±μ</th>
					<td width="150">${name }</td> <!-- μΈμκ°μμ κ°μ Έμ¨λ€ -->
					<th width="150">μμ±μΌμ</th>
					<td width="150">
						<input type="date" id="wdate" name="wdate">
					</td>
				</tr>
				<tr>
					<th>μ  λͺ©</th>
					<td colspan="3">
						<input type="text" id="title" name="title" size="95">
					</td>
				</tr>
				<tr>
					<th>λ΄ μ©</th>
					<td colspan="3">
						<textarea rows="6" cols="100" id="subject" name="subject"></textarea>
					</td>
				</tr>
				<tr>
					<th>μ²¨λΆνμΌ</th>
					<td colspan="3">
						<input type="file" id="fileName" name="fileName">
					</td>
				</tr>
			</table><br>
		</div>
			<input type="submit" value="μ  μ₯"> &nbsp;&nbsp;&nbsp;
			<input type="reset" value="μ·¨ μ">
		</form>
	</div>
	<script type="text/javascript"> <!-- μ€λ λ μ§λ‘ μλ μ€μ -->
		document.getElementById('wdate').value = new Date().toISOString().substring(0, 10);
</script>
	
</div>
</body>
</html>