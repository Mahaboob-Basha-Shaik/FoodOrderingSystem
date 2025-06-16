<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Restaurant, java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Swiggy</title>

<!-- Google Fonts: Poppins -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
	rel="stylesheet" />

<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<style>
/* Reset & Global */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: #f4f4f4;
}

/* Header Section */
.header-image {
	width: 100%;
	height: 300px;
	background-image:
		url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1470&q=80');
	background-size: cover;
	background-position: center;
	position: relative;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	color: #fff;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.7);
}

.navbar {
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 16px 30px;
	background-color: rgba(255, 255, 255, 0.9);
	position: absolute;
	top: 0;
	left: 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.navbar img {
	height: 45px;
}

.nav-links {
	display: flex;
	gap: 20px;
	font-size: 18px;
}

.nav-links a {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	cursor: pointer;
	text-decoration: none;
	color: #333;
	font-weight: 500;
}

.nav-links a:hover {
	color: #fc8019;
}

.nav-icon {
	width: 20px;
	height: 20px;
	object-fit: contain;
}

.banner-text {
	margin-top: 80px;
}

.banner-text h1 {
	font-size: 42px;
	margin-bottom: 10px;
}

.banner-text p {
	font-size: 20px;
}

.order-btn {
	margin-top: 20px;
	padding: 12px 30px;
	background-color: #fc8019;
	color: white;
	font-weight: 600;
	font-size: 18px;
	border: none;
	border-radius: 30px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	text-decoration: none;
	display: inline-block;
}

.order-btn:hover {
	background-color: #e66d00;
}

/* === NEW CIRCULAR ITEMS SECTION === */
.round-items-section {
	text-align: center;
	margin: 50px 0 30px;
}

.round-items-title {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 20px;
	color: #333;
}

.round-items {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 30px;
}

.round-item {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	overflow: hidden;
	border: 3px solid #fc8019;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	cursor: pointer;
	transition: transform 0.3s ease;
}

.round-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.round-item:hover {
	transform: scale(1.1);
}

/* Cards */
.container {
	max-width: 1280px;
	margin: 30px auto;
	padding: 0 20px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 30px;
}

.card {
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	overflow: hidden;
	transition: transform 0.2s;
	cursor: pointer;
}

.card:hover {
	transform: scale(1.01);
}

.card img {
	width: 100%;
	height: 250px;
	object-fit: cover;
}

.card-body {
	padding: 24px;
}

.card-body h3 {
	margin: 0 0 12px;
	font-size: 1.5rem;
}

.desc {
	color: #555;
	font-size: 16px;
	margin-bottom: 10px;
}

.info {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.price {
	color: #e76f51;
	font-weight: bold;
	font-size: 20px;
}

.rating {
	background-color: #48c479;
	color: white;
	padding: 4px 10px;
	border-radius: 6px;
	font-size: 16px;
}

.popular-choices {
	padding: 50px 20px;
	background: #fff;
	text-align: center;
}

.section-title {
	font-size: 30px;
	color: #222;
	margin-bottom: 30px;
	font-weight: 700;
}

.choices-grid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 30px;
}

.choice-item {
	width: 130px;
	display: flex;
	flex-direction: column;
	align-items: center;
	transition: transform 0.3s ease;
}

.choice-item:hover {
	transform: scale(1.05);
}

.choice-item img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.choice-name {
	margin-top: 10px;
	font-size: 16px;
	font-weight: 600;
	color: #333;
	text-transform: capitalize;
}

/* Contact Section */
.contact-section {
	background-color: #fff;
	padding: 50px 20px;
	text-align: center;
	margin-top: 60px;
}

.contact-section h2 {
	font-size: 32px;
	margin-bottom: 10px;
	color: #333;
}

.contact-section p {
	font-size: 16px;
	color: #666;
}

.contact-section a {
	color: #fc8019;
	text-decoration: none;
	font-weight: bold;
}

/* Footer */
.footer {
	background-color: #282c34;
	color: #fff;
	padding: 40px 20px;
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.footer-col {
	flex: 1 1 200px;
	margin: 10px 20px;
}

.footer-col h4 {
	font-size: 18px;
	margin-bottom: 15px;
	color: #ff5722;
}

.footer-col ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.footer-col ul li {
	margin-bottom: 10px;
}

.footer-col ul li a {
	color: #bbb;
	text-decoration: none;
	transition: color 0.3s ease;
}

.footer-col ul li a:hover {
	color: #ff5722;
}

.social-links {
	list-style: none;
	padding: 0;
}

.social-links li {
	margin-bottom: 10px;
}

.social-links a {
	color: #bbb;
	text-decoration: none;
	font-size: 16px;
	display: flex;
	align-items: center;
	gap: 8px;
	transition: color 0.3s ease;
}

.social-links a:hover {
	color: #ff5722;
}

.social-links i {
	font-size: 20px;
}

/* Responsive */
@media ( max-width : 900px) {
	.container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 600px) {
	.container {
		grid-template-columns: 1fr;
	}
	.card img {
		height: 200px;
	}
	.banner-text h1 {
		font-size: 28px;
	}
	.banner-text p {
		font-size: 16px;
	}
	.footer {
		flex-direction: column;
		align-items: center;
	}
	.footer-col {
		margin: 15px 0;
	}
}

/* Responsive */
@media ( max-width : 900px) {
	.container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 600px) {
	.container {
		grid-template-columns: 1fr;
	}
	.card img {
		height: 200px;
	}
	.banner-text h1 {
		font-size: 28px;
	}
	.banner-text p {
		font-size: 16px;
	}
}
</style>
</head>

<body>

	<!-- Header -->
	<div class="header-image">
		<div class="navbar">
			<a href="first"> <img
				src="https://upload.wikimedia.org/wikipedia/en/thumb/2/27/Swiggy_logo_%28old%29.svg/2560px-Swiggy_logo_%28old%29.svg.png"
				alt="Swiggy Logo" style="height: 50px;" /></a>
			<div class="nav-links">
				<a href="first"><img
					src="https://img.icons8.com/ios-filled/24/000000/home.png"
					class="nav-icon" /> Home</a> <a
					href="<%=request.getContextPath()%>/all-menus"><img
					src="https://img.icons8.com/ios-filled/24/000000/menu.png"
					class="nav-icon" /> Menu</a> <a href="login.jsp"><img
					src="https://img.icons8.com/ios-filled/24/000000/login-rounded-right.png"
					class="nav-icon" /> Login</a> <a href="Profile.jsp"><img
					src="https://img.icons8.com/ios-filled/24/000000/user.png"
					class="nav-icon" /> Profile</a> <a
					href="<%=request.getContextPath()%>/cart?action=view"><img
					src="https://img.icons8.com/ios-filled/24/000000/shopping-cart.png"
					class="nav-icon" /> Cart</a>
			</div>
		</div>
		<div class="banner-text">
			<h1>Order Food Online From Your Favourite Restaurant</h1>
			<p>Find restaurants that deliver near you</p>
			<a href="all-menus" class="order-btn">Order Now</a>
		</div>
	</div>

	<!-- === Popular Choices Section === -->
	<section class="popular-choices">
		<h2 class="section-title">Popular Choices</h2>
		<div class="choices-grid">
			<div class="choice-item">
				<img
					src="https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=170667a&w=is&k=20&c=4lA5wHN1tOdZIJouP_Q9EYlc5F8KkkZ6XEK4TIDtt_A="
					alt="Pizza"> <span class="choice-name">Pizza</span>
			</div>
			<div class="choice-item">
				<img
					src="https://content.jdmagicbox.com/v2/comp/bangalore/u1/080pxx80.xx80.220620000405.i3u1/catalogue/mcdonald-s-gourmet-burger-collection-hanumantha-nagar-bangalore-burger-joints-0vh8c36ylp.jpg"
					alt="Burger"> <span class="choice-name">Burger</span>
			</div>
			<div class="choice-item">
				<img
					src="https://www.thehosteller.com/_next/image/?url=https%3A%2F%2Fstatic.thehosteller.com%2Fhostel%2Fimages%2Fimage.jpg%2Fimage-1744199226259.jpg&w=2048&q=75"
					alt="Biryani"> <span class="choice-name">Biryani</span>
			</div>
			<div class="choice-item">
				<img
					src="https://images.getrecipekit.com/20241008094433-blog-20templates-20-3.webp?aspect_ratio=16:9&quality=90&"
					alt="Noodles"> <span class="choice-name">Noodles</span>
			</div>
			<div class="choice-item">
				<img
					src="https://www.keep-calm-and-eat-ice-cream.com/wp-content/uploads/2022/08/Ice-cream-sundae-hero-11.jpg"
					alt="Ice Cream"> <span class="choice-name">Ice Cream</span>
			</div>
			<div class="choice-item">
				<img
					src="https://media.istockphoto.com/id/504754220/photo/cocktails.jpg?s=612x612&w=0&k=20&c=NxIzGT-LbUS0BAPoCMDY3mEp96AnIxxldbWmFMeeD-A="
					alt="Beverages"> <span class="choice-name">Beverages</span>
			</div>
			<div class="choice-item">
				<img
					src="https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2024-06/image%20%283%29_1.jpg"
					alt="Beverages"> <span class="choice-name">Drinks</span>
			</div>
			<div class="choice-item">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfgxUgK_lY_Q8gH9QQo_qZ7L06YcHbxYfCnA&s"
					alt="Beverages"> <span class="choice-name">Chill Items</span>
			</div>
		</div>
	</section>


	<!-- Restaurant Cards -->
	<div class="container section active" id="menu">
		<%
		List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("allRestaurants");
		if (restaurants != null && !restaurants.isEmpty()) {
			for (Restaurant restaurant : restaurants) {
		%>
		<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
			style="text-decoration: none; color: inherit;">
			<div class="card">
				<img src="<%=restaurant.getImagepath()%>"
					alt="<%=restaurant.getName()%>" />
				<div class="card-body">
					<h3><%=restaurant.getName()%></h3>
					<p class="desc">
						<strong>Cuisine:</strong>
						<%=restaurant.getCuisine() != null ? restaurant.getCuisine() : "N/A"%></p>
					<p class="desc">
						<strong>Address:</strong>
						<%=restaurant.getAddress() != null ? restaurant.getAddress() : "N/A"%></p>
					<p class="desc">
						<strong>Delivery Time:</strong>
						<%=restaurant.getDeliveryTime()%>
						mins
					</p>
					<p class="desc">
						<strong>Active:</strong>
						<%=restaurant.isActive() ? "Yes" : "No"%></p>
					<div class="info">
						<div class="rating"><%=restaurant.getRating() != 0 ? restaurant.getRating() : "N/A"%>
							★
						</div>
					</div>
				</div>
			</div>
		</a>
		<%
		}
		} else {
		%>
		<p style="text-align: center; font-size: 18px; color: #555;">No
			restaurants available at the moment.</p>
		<%
		}
		%>
	</div>

	<!-- Contact Section -->
	<div class="contact-section">
		<h2>Contact Us</h2>
		<p>
			Have questions or feedback? Reach out at <a
				href="mailto:support@swiggy.in">support@swiggy.in</a> or visit <a
				href="https://www.swiggy.com/help" target="_blank" rel="noopener">Swiggy
				Help Center</a>
		</p>
	</div>

	<!-- Footer -->

	<div class="footer">
		<div class="footer-col">
			<h4>Company</h4>
			<ul>
				<li><a href="https://www.swiggy.com/corporate/" target="_blank"
					rel="noopener"> <i class="fas fa-building"></i> About
				</a></li>
				<li><a href="https://www.swiggy.com/careers" target="_blank"
					rel="noopener"> <i class="fas fa-briefcase"></i> Careers
				</a></li>
				<li><a href="https://www.swiggy.com/team" target="_blank"
					rel="noopener"> <i class="fas fa-users"></i> Team
				</a></li>
				<li><a href="https://www.swiggy.com/blog" target="_blank"
					rel="noopener"> <i class="fas fa-blog"></i> Blog
				</a></li>
			</ul>
		</div>

		<!-- Contact -->
		<div class="footer-col">
			<h4>Contact</h4>
			<ul>
				<li><a href="mailto:support@swiggy.in"> <i
						class="fas fa-envelope"></i> Email Support
				</a></li>
				<li><a href="https://www.swiggy.com/help" target="_blank"
					rel="noopener"> <i class="fas fa-headset"></i> Help & Support
				</a></li>
				<li><a href="https://partner.swiggy.com/" target="_blank"
					rel="noopener"> <i class="fas fa-handshake"></i> Partner with
						Us
				</a></li>
				<li><a href="https://ride.swiggy.com/" target="_blank"
					rel="noopener"> <i class="fas fa-motorcycle"></i> Ride with Us
				</a></li>
			</ul>
		</div>

		<!-- Legal -->
		<div class="footer-col">
			<h4>Legal</h4>
			<ul>
				<li><a href="https://www.swiggy.com/terms-and-conditions"
					target="_blank" rel="noopener"> <i class="fas fa-file-contract"></i>
						Terms & Conditions
				</a></li>
				<li><a href="https://www.swiggy.com/privacy-policy"
					target="_blank" rel="noopener"> <i class="fas fa-user-shield"></i>
						Privacy Policy
				</a></li>
				<li><a href="https://www.swiggy.com/cookie-policy"
					target="_blank" rel="noopener"> <i class="fas fa-cookie-bite"></i>
						Cookie Policy
				</a></li>
				<li><a href="https://www.swiggy.com/refund-policy"
					target="_blank" rel="noopener"> <i class="fas fa-undo-alt"></i>
						Refund Policy
				</a></li>
			</ul>
		</div>
		<div class="footer-col">
			<h4>Social</h4>
			<ul class="social-links">
				<li><a href="https://facebook.com/swiggy" target="_blank"
					rel="noopener"><i class="fab fa-facebook-f"></i> Facebook</a></li>
				<li><a href="https://twitter.com/swiggy" target="_blank"
					rel="noopener"><i class="fab fa-twitter"></i> Twitter</a></li>
				<li><a href="https://instagram.com/swiggy" target="_blank"
					rel="noopener"><i class="fab fa-instagram"></i> Instagram</a></li>
				<li><a href="https://youtube.com/swiggy" target="_blank"
					rel="noopener"><i class="fab fa-youtube"></i> YouTube</a></li>
			</ul>
		</div>
	</div>

</body>
</html>
