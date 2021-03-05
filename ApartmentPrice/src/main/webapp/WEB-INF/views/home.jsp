<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<div>
		<div>년도 : ${list.deal_year }</div>
		<div>월: ${list.deal_month }</div>
		<div>지역 번호: ${list.regional_code }</div>
		<div>
			<a href="result?location_cd=${list.regional_code}"><button>검색버튼</button></a>
		</div>
	</div>
</body>
</html>