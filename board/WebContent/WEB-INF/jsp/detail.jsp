<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디테일</title>
</head>
<body>
	<div>
		<a href="/list">리스트로 돌아가기</a>
		<a href="/del?i_board=${param.i_board}"><button>삭제</button></a>
		<a href="/update?i_board=${param.i_board}"><button>수정</button></a>
	</div>
	<div>
		<div>번호: ${data.i_board} or ${param.i_board}</div>
		<div>타이틀: ${data.title}</div>
		<div>작성일시: ${data.r_dt}</div>
		<hr>
		<div>${data.ctnt}</div>
	</div>
</body>
</html>