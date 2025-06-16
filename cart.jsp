<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.tap.model.CartItem, java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Your Cart - Swiggy Clone</title>

<style>
/* Navbar styles */
.nav-links {
	display: flex;
	justify-content: center;
	gap: 20px;
	background-color: white;
	padding: 10px 20px;
	align-items: center;
	font-family: Arial, sans-serif;
}

.nav-links a {
	color: #ff6600;
	text-decoration: none;
	font-weight: 600;
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: 16px;
	padding: 6px 12px;
	border-radius: 6px;
	transition: background-color 0.3s ease, box-shadow 0.3s ease, color 0.3s
		ease;
	position: relative;
}

.nav-links a .nav-icon {
	width: 24px;
	height: 24px;
	color: #ff6600;
	fill: currentColor;
	transition: color 0.3s ease, filter 0.3s ease;
}

.nav-links a:hover {
	background-color: black;
	box-shadow: 0 0 8px 3px rgba(255, 102, 0, 0.6);
	color: #ff4500;
}

.nav-links a:hover .nav-icon {
	color: #ff4500;
	filter: drop-shadow(0 0 4px #ff4500);
}

.nav-icon {
	width: 24px;
	height: 24px;
}

/* Cart styles */
body {
	font-family: Arial, sans-serif;
	margin: 30px;
	background: white;
}

h1 {
	color: #fc8019;
	margin-bottom: 25px;
	text-align: center;
}

.cart-container {
	display: flex;
	flex-wrap: wrap;
	gap: 24px;
	justify-content: center;
}

.cart-card {
	background: white;
	width: 320px;
	border-radius: 12px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 16px;
	display: flex;
	flex-direction: column;
	align-items: center;
	transition: transform 0.3s ease;
}

.cart-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.cart-img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 10px;
	margin-bottom: 16px;
}

.item-name {
	font-size: 1.3em;
	font-weight: bold;
	margin-bottom: 6px;
	text-align: center;
	color: #333;
}

.item-desc {
	font-size: 0.9em;
	color: #666;
	margin-bottom: 12px;
	text-align: center;
	min-height: 40px;
}

.price, .subtotal {
	font-weight: bold;
	color: #111;
	font-size: 1.1em;
}

.price {
	margin-bottom: 10px;
}

.quantity-control {
	display: flex;
	gap: 12px;
	align-items: center;
	margin-bottom: 14px;
}

.quantity-control button {
	width: 32px;
	height: 32px;
	border: none;
	background-color: #fc8019;
	color: white;
	font-weight: bold;
	border-radius: 6px;
	cursor: pointer;
	font-size: 20px;
	line-height: 20px;
	transition: background-color 0.3s;
}

.quantity-control button:hover {
	background-color: #e76b08;
}

.quantity-display {
	font-size: 1.2em;
	width: 36px;
	text-align: center;
	user-select: none;
}

.remove-btn {
	background-color: #ff4d4d;
	border: none;
	padding: 8px 18px;
	color: white;
	border-radius: 8px;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s;
	margin-top: auto;
}

.remove-btn:hover {
	background-color: #cc0000;
}

.total-container {
	max-width: 320px;
	margin: 30px auto 0;
	padding: 16px;
	background: #fff4e5;
	border-radius: 12px;
	font-size: 1.4em;
	font-weight: bold;
	color: #fc8019;
	text-align: center;
	box-shadow: 0 4px 10px rgba(252, 128, 25, 0.25);
}

.empty-msg {
	text-align: center;
	font-size: 1.2em;
	color: #666;
	margin-top: 60px;
}

/* New button style for Back to Menu */
.back-btn {
	display: block;
	max-width: 320px;
	margin: 40px auto 0;
	text-align: center;
	background-color: #fc8019;
	color: white;
	padding: 12px 24px;
	border-radius: 10px;
	text-decoration: none;
	font-weight: bold;
	font-size: 1.1em;
	box-shadow: 0 4px 10px rgba(252, 128, 25, 0.3);
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.back-btn:hover {
	background-color: #e76b08;
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(252, 128, 25, 0.4);
}

.place-order-btn {
	background-color: #28a745;
	color: white;
	padding: 12px 24px;
	font-size: 1.2em;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s ease;
	width: 100%;
	margin-top: 20px;
}

.place-order-btn:hover {
	background-color: #218838;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<div class="nav-links">
		<a href="first"> <img
			src="https://img.icons8.com/ios-filled/24/ffffff/home.png"
			alt="Home Icon" class="nav-icon" /> Home
		</a> <a href="<%=request.getContextPath()%>/all-menus"> <img
			src="https://img.icons8.com/ios-filled/24/ffffff/menu.png"
			alt="Menu Icon" class="nav-icon" /> Menu
		</a> <a href="<%=request.getContextPath()%>/first"> <img
			src="https://img.icons8.com/ios-filled/24/ffffff/restaurant.png"
			alt="Restaurants Icon" class="nav-icon" /> Restaurants
		</a> <a href="login.jsp"> <img
			src="https://img.icons8.com/ios-filled/24/ffffff/login-rounded-right.png"
			alt="Login Icon" class="nav-icon" /> Login
		</a> <a href="Profile.jsp"> <img
			src="https://img.icons8.com/ios-filled/24/ffffff/user.png"
			alt="Profile Icon" class="nav-icon" /> Profile
		</a> <a href="<%=request.getContextPath()%>/cart?action=view"> <img
			src="https://img.icons8.com/ios-filled/24/ffffff/shopping-cart.png"
			alt="Cart Icon" class="nav-icon" /> Cart
		</a>
	</div>

	<h1>Your Cart</h1>

	<%
	Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

	if (cart == null || cart.isEmpty()) {
	%>
	<p class="empty-msg">Your cart is empty.</p>
	<%
	} else {
	double total = 0.0;
	%>

	<div class="cart-container">
		<%
		for (CartItem item : cart.values()) {
			double subtotal = item.getMenu().getPrice() * item.getQuantity();
			total += subtotal;
		%>
		<div class="cart-card">

			<img src="<%=item.getMenu().getImagePath()%>"
				alt="<%=item.getMenu().getItemName()%>" class="cart-img" />


			<div class="item-name"><%=item.getMenu().getItemName()%></div>
			<div class="item-desc"><%=item.getMenu().getDescription() != null ? item.getMenu().getDescription() : ""%></div>

			<div class="price">
				Price: ₹<%=String.format("%.2f", item.getMenu().getPrice())%></div>

			<div class="quantity-control">
				<form action="<%=request.getContextPath()%>/cart" method="post"
					style="display: inline;">
					<input type="hidden" name="action" value="decrease" /> <input
						type="hidden" name="menuId"
						value="<%=item.getMenu().getMenuId()%>" />
					<button type="submit">−</button>
				</form>

				<div class="quantity-display"><%=item.getQuantity()%></div>

				<form action="<%=request.getContextPath()%>/cart" method="post"
					style="display: inline;">
					<input type="hidden" name="action" value="add" /> <input
						type="hidden" name="menuId"
						value="<%=item.getMenu().getMenuId()%>" />
					<button type="submit">+</button>
				</form>
			</div>

			<div class="subtotal">
				Subtotal: ₹<%=String.format("%.2f", subtotal)%></div>

			<form action="<%=request.getContextPath()%>/cart" method="post"
				style="width: 100%; text-align: center; margin-top: 12px;">
				<input type="hidden" name="action" value="remove" /> <input
					type="hidden" name="menuId" value="<%=item.getMenu().getMenuId()%>" />
				<button class="remove-btn" type="submit">Remove</button>
			</form>
		</div>
		<%
		}
		%>
	</div>

	<div class="total-container">
		Total: ₹<%=String.format("%.2f", total)%>
	</div>

	<form action="<%=request.getContextPath()%>/order" method="post"
		style="max-width: 320px; margin: 20px auto; text-align: center;">
		<button type="submit" class="place-order-btn">Place Order</button>
	</form>

	<%
	}
	%>

	<%
	Integer restaurantId = (Integer) session.getAttribute("restaurantId");
	if (restaurantId != null) {
	%>
	<a
		href="<%=request.getContextPath()%>/menu?restaurantId=<%=restaurantId%>"
		class="back-btn"> ← Back to Menu </a>
	<%
	} else {
	%>
	<a href="<%=request.getContextPath()%>/all-menus" class="back-btn">
		← Back to Menu </a>
	<%
	}
	%>

</body>
</html>
