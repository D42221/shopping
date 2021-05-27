<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Welcom shopping!</title>
</head>
<body>
	<!-- メニュー -->
	<jsp:include page="/menu.jsp" />
	 <p>ようこそ、<%=session.getAttribute("name")%>さん</p>


	<p>このサイトは何でも揃うショッピングサイトです！！！</p>
	<p>お買い物楽しんでね！！</p>
</body>
</html>