<%@page import="var.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	sum s = new sum();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div>계산할 값을 입력하여 주세요.</div>
</head>
<body>
	<form action="add" method="post">
		<div>
			<label>x : </label>
			<input type="text" name="x" >
		</div>
		<div>
			<label>y :</label>
			<input type="text" name="y" >
		</div>
		<div>
			<input type="submit" value="덧셈" >
		</div>
		<div>
			계산 : <%= s.getsum() %> 
		</div>
	</form>
</body>
</html>