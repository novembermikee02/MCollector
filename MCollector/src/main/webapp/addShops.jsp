
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Shubham Communication</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo me-auto">
				<a href="index.jsp">MCollector</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar">
				<ul>
					<%
					if (session.getAttribute("role").equals("Admin")) {
					%>
					<li><a class="nav-link scrollto active" href="viewShops.jsp">View
							Shops</a></li>
					<li><a class="nav-link scrollto" href="addShops.jsp">Add
							New Shops</a></li>
					<%
					} else {
					%>
					<li><a class="nav-link scrollto active" href="#hero"></a></li>
					<%
					}
					%>



					<li><a class="nav-link scrollto" href="#about">Collect
							Money</a></li>
					<li><a class="nav-link scrollto" href="#services">Today
							Collection</a></li>
					<li><a class="nav-link scrollto" href="logout">Logout</a></li>
					<li><a class="getstarted scrollto" href="logout"><%=session.getAttribute("name")%></a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" style="height: 100vh">

		<!-- ======= Contact Section ======= -->
		<section class="contact" style="margin: 30px; margin-top: 0px;">
			<div class="row">
				<div class="col"></div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col-6">
					<div class="section-title" style="padding-bottom: 0 !important;">
						<h2>Add New Shop</h2>
					</div>
					<div>
						<form action="addshop" method="post" class="php-email-form"
							style="border-radius: 12px !important;">
							<div class="row">
								<div class="form-group col-md-6">
									<label for="shopname">Shop Name</label> <input type="text"
										name="shopname" class="form-control" id="shopname" required>
								</div>
								<div class="form-group col-md-6">
									<label for="name">Shop Address</label> <input type="text"
										class="form-control" name="shopaddress" id="shopaddress"
										required>
								</div>
							</div>
							<div class="text-center">
								<button type="submit">Add Shop</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col"></div>
			</div>
		</section>
		<!-- End Contact Section -->
	</section>
	<!-- End Hero -->

	<main id="main"></main>
	<!-- End #main -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>


	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>