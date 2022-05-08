<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>


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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
	<section id="hero" style="height: auto">

		<!-- ======= Contact Section ======= -->
		<section class="contact" style="margin: 30px; margin-top: 0px;">
			<div class="row">
				<div class="col">
					<div class="section-title" style="padding-bottom: 0 !important;">
						<h2>List Of Shops</h2>
					</div>
				</div>
				<div class="col">
					<div class="section-title" style="padding-bottom: 0 !important;">
						<h2>Add Money for Selected Shop</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div>
						<div class="info">
							<input type="text" id="myInput" placeholder="Search for names.."
								title="Type in a name">
							<table class="table" id="myTable">
								<thead class="thead-dark">
									<tr>
										<th scope="col">#</th>
										<th scope="col">Shop Name</th>
										<th scope="col">Date</th>
									</tr>
								</thead>
								<tbody>
									<%
									Connection con = null;
									Statement st = null;
									ResultSet rs = null;
									HttpSession session1 = request.getSession();
									try {
										Class.forName("com.mysql.jdbc.Driver");
										con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcollectordb", "root", "Neel0225@@");
										st = con.createStatement();
										String qry = "select * from shops";
										rs = st.executeQuery(qry);

										while (rs.next()) {
											//System.out.println("Sr" + rs.getString(1) + "Shop_name" + rs.getString(2));
											//out.print("Sr" + rs.getString(1) + "Shop_name" + rs.getString(2));
											String id = rs.getString(1);
											session.setAttribute("id", rs.getString(1));
									%>
									<tr>
										<th scope="row"><%=rs.getString(1)%></th>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><a href="viewShops.jsp?id=<%=id%>">Select</a></td>
									</tr>
									<%
									}
									} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
									}
									%>
								</tbody>
							</table>
						</div>

					</div>
				</div>
				<div class="col">

					<div>
						<form action="viewshop" method="post" class="php-email-form">
							<%
							Connection con1 = null;
							PreparedStatement pst = null;
							ResultSet rss = null;
							String id = request.getParameter("id");
							try {
								Class.forName("com.mysql.jdbc.Driver");
								con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcollectordb", "root", "Neel0225@@");
								pst = con1.prepareStatement("select * from shops where s_id = ?");
								pst.setString(1, id);

								rss = pst.executeQuery();

								while (rss.next()) {
							%>

							<input type="hidden" name="uid" class="form-control" id="uid"
								value="<%=session.getAttribute("u_id")%>" required>


							<div class="form-group col-md-6">
								<label for="name">Shop ID</label> <input type="text"
									name="shopid" class="form-control" id="shopid"
									value="<%=request.getParameter("id")%>" required>
							</div>
							<div class="row">
								<div class="form-group col-md-6">
									<label for="name">Shop Name</label> <input type="text"
										name="shopname" class="form-control" id="shopname"
										value="<%=rss.getString("shop_name")%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="name">Shop Address</label> <input type="text"
										class="form-control" name="shopaddress" id="shopaddress"
										value="<%=rss.getString("shop_address")%>" required>
								</div>
							</div>
							<div class="form-group">
								<label for="name">Total Amount</label> <input type="text"
									class="form-control" name="totalamount" id="totalamount"
									required>
							</div>
							<div class="my-3">
								<div class="loading">Loading</div>
								<div class="error-message"></div>
								<div class="sent-message">Your message has been sent.
									Thank you!</div>
							</div>
							<div class="text-center">
								<button type="submit">ADD AMOUNT</button>
							</div>
							<%
							}
							} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
							}
							%>

						</form>
					</div>
				</div>
			</div>



			<div class="row">




				<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">


				</div>

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

	<script type="text/javascript">
		$(document).ready(
				function() {
					var $rows = $('#myTable tr');
					$('#myInput').keyup(
							function() {
								var val = $.trim($(this).val()).replace(/ +/g,
										' ').toLowerCase();

								$rows.show().filter(
										function() {
											var text = $(this).text().replace(
													/\s+/g, ' ').toLowerCase();
											return !~text.indexOf(val);
										}).hide();
							});
				});
	</script>

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