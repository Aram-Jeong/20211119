<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var STATUS; // 전역변수 선언 select의 변경된 값을 저장
	function authorEdit(id){
		var id = id;
		// ajax로 처리해야 하는 부분
		// 권한값을 어떻게 찾을지 고민..
		$.ajax({
			url : 'ajaxAuthorUpdate.do', // 호출명
			type : 'post',					// 전송방식 
			data : {id : id, author : STATUS}, //전달할 데이터 key:value
			dataType : 'text',
			success : function(data){ // data에 리턴값이 담겨 있다
				if(data == 'yes'){
					alert(id + "님의 권한이 변경되었습니다.");
				}else{
					alert(id + "님의 권한변경에 실패했습니다.")
				}
			} 
		
		});
		
	}
	$(function(){
		$("select").change(function(){
			STATUS=$(this).val();
		});
	});
</script>
</head>
<body>
<jsp:include page="../home/header.jsp"></jsp:include>
<div align="center">
	<div><h1>멤 버 목 록</h1></div>
	<div>
		<table border="1">
			<tr>
				<th width="150">아이디</th>
				<th width="150">이  름</th>
				<th width="150">연락처</th>
				<th width="400">주  소</th>
				<th width="150">권  한</th>
				<th width="100">권한수정</th>
			</tr>
			<c:forEach items="${members }" var="member" varStatus="status">
				<tr onmouseover="this.style.background='wheat';"
					onmouseleave="this.style.background='white';">
					<td align="center">${member.id }</td>
					<td align="center">${member.name }</td>
					<td align="center">${member.tel }</td>
					<td>&nbsp;${member.address }</td>
					<td align="center">
						<select id="author${status.count}" name="author">
								<option value="ADMIN" <c:if test="${member.author eq 'ADMIN' }">selected</c:if>>ADMIN</option>
								<option value="USER" <c:if test="${member.author eq 'USER' }">selected</c:if>>USER</option>						
						</select>
					</td>
					<td align="center">
						<button type="button" onclick="authorEdit('${member.id}', '${status.count}')">변경</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div><br>
	<button type="button" onclick="location.href='home.do'">홈으로</button>
</div>
</body>
</html>