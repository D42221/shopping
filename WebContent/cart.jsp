<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>
<body>
	<!-- メニュー -->
	<jsp:include page="/menu.jsp" />

	<h3>現在のカートの中身</h3>

	<c:if test="${empty cart.items}">
	<p>カートは空です。</p>
	</c:if>

	<c:if test="${not empty cart.items}">
	<table border="1">
		<tr>
			<th>商品番号</th>
			<th>商品名</th>
			<th>単価（税込）</th>
			<th>個数</th>
			<th>小計</th>
			<th>削除</th>
		</tr>
		<c:forEach items="${cart.items}" var="item">
		<tr>
			<td>${item.value.code}</td>
			<td>${item.value.name}</td>
			<td>${item.value.price}円</td>
			<td>${item.value.quantity}
<<<<<<< HEAD
	<form action="/shopping/CartServlet?action=add" method="post">
		<input type="submit" value="商品の増加" />
	</form>
	<form action="/shopping/CartServlet?action=sub" method="post">
	<input type="submit" value="商品の減少" />
	</form>
=======
		<form>
		<select name="quantity">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>個<br/>
		<button name = "operater" value = "plus"> + </button>


		<button name = "operater" value = "minus"> - </button>
		</form>
>>>>>>> branch 'main' of https://github.com/D42221/shopping
			</td>
			<td>${item.value.price * item.value.quantity}円</td>
			<td>
				<form action="/shopping/CartServlet?action=delete" method="post">
					<input type="hidden" name="item_code" value="${item.value.code}" />
					<input type="submit" value="削除" />
				</form>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6" style="text-align:right">総計：${cart.total}円</td>
		</tr>
	</table>
	<form action="/shopping/OrderServlet?action=input_customer" method="post">
		<input type="submit" value="注文する" />
	</form>
	</c:if>

</body>
</html>