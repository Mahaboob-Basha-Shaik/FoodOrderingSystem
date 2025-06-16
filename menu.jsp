<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Menu, java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Menu Items</title>
<style>
h1 {
	color: #fc8019;
	text-align: center;
	margin-bottom: 20px;
}

.menu-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
}

.card {
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	width: 250px;
	padding: 16px;
	display: flex;
	flex-direction: column;
	align-items: center;
	transition: box-shadow 0.3s, transform 0.3s;
}

.card:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transform: translateY(-5px);
}

.card img {
	width: 100%;
	height: 160px;
	object-fit: cover;
	border-radius: 8px;
	margin-bottom: 12px;
}

.card h3, .card p {
	margin: 4px 0;
	color: #333;
	text-align: center;
}

.card .price {
	font-weight: bold;
	color: #111;
}

.availability {
	color: green;
	font-size: 13px;
}

.unavailable {
	color: red;
	font-size: 13px;
}

.rating {
	color: #fc8019;
	font-size: 13px;
}

.add-cart {
	margin-top: 12px;
	padding: 8px 14px;
	background: #fc8019;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.3s;
}

.add-cart:hover {
	background: #e76b08;
}

.nav-links {
	text-align: center;
	margin-bottom: 30px;
}

.nav-links a {
	margin: 0 12px;
	text-decoration: none;
	color: #333;
	font-weight: 600;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	padding: 8px 12px;
	border-radius: 5px;
	transition: background 0.3s, color 0.3s;
}

.nav-links a:hover, .nav-links a.active {
	background: #fc8019;
	color: white;
}

.nav-icon {
	width: 20px;
	height: 20px;
}

.back-to-menu-btn {
	background: #fc8019;
	color: white;
	border: none;
	padding: 10px 18px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 6px;
	cursor: pointer;
	transition: background 0.3s;
	margin-top: 30px;
}

.back-to-menu-btn:hover {
	background: #e76b08;
}
</style>
</head>
<body>

	<div class="nav-links">
		<a href="first"
			class="<%=request.getRequestURI().endsWith("first") ? "active" : ""%>">
			<img src="https://img.icons8.com/ios-filled/24/000000/home.png"
			class="nav-icon" /> Home
		</a> <a href="<%=request.getContextPath()%>/all-menus"
			class="<%=request.getRequestURI().contains("all-menus") ? "active" : ""%>">
			<img src="https://img.icons8.com/ios-filled/24/000000/menu.png"
			class="nav-icon" /> Menu
		</a> <a href="login.jsp"
			class="<%=request.getRequestURI().contains("login.jsp") ? "active" : ""%>">
			<img
			src="https://img.icons8.com/ios-filled/24/000000/login-rounded-right.png"
			class="nav-icon" /> Login
		</a> <a href="Profile.jsp"
			class="<%=request.getRequestURI().contains("Profile.jsp") ? "active" : ""%>">
			<img src="https://img.icons8.com/ios-filled/24/000000/user.png"
			class="nav-icon" /> Profile
		</a> <a href="<%=request.getContextPath()%>/cart?action=view"
			class="<%=request.getRequestURI().contains("cart") ? "active" : ""%>">
			<img
			src="https://img.icons8.com/ios-filled/24/000000/shopping-cart.png"
			class="nav-icon" /> Cart
		</a>
	</div>

	<h1>Menu Items</h1>

	<%
	List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
	if (menuList != null && !menuList.isEmpty()) {
	%>
	<div class="menu-container">
		<%
		for (Menu menu : menuList) {
		%>
		<div class="card">
			<img src="<%=menu.getImagePath()%>" alt="Menu Item Image" />
			<h3><%=menu.getItemName() != null ? menu.getItemName() : "N/A"%></h3>
			<p><%=menu.getDescription() != null ? menu.getDescription() : "No description available."%></p>
			<p class="price">
				₹<%=String.format("%.2f", menu.getPrice())%></p>
			<p class="<%=menu.isAvailable() ? "availability" : "unavailable"%>">
				<%=menu.isAvailable() ? "Available" : "Out of Stock"%>
			</p>
			<p class="rating"><%=menu.getRating() > 0 ? menu.getRating() + " ★" : "No rating"%></p>
			<form action="<%=request.getContextPath()%>/cart" method="get">
				<input type="hidden" name="action" value="add" /> <input
					type="hidden" name="menuId" value="<%=menu.getMenuId()%>" />
				<button type="submit" class="add-cart"
					<%=!menu.isAvailable() ? "disabled" : ""%>>Add to Cart</button>
			</form>
		</div>
		<%
		}
		%>
	</div>
	<%
	} else {
	%>
	<p style="text-align: center;">No menu items available for this
		restaurant.</p>
	<%
	}
	%>

	<div style="text-align: center;">
		<form action="<%=request.getContextPath()%>/first" method="get">
			<button type="submit" class="back-to-menu-btn">&#8592; Back
				to Restaurants</button>
		</form>
	</div>

</body>
</html>
