<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="com.app.model.*"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


	<style>
		.welcome-bar {
			display: flex;
			height: 100px;
		}

		.container__panoramica {
			border: 3px solid blue;
			height: 300px;
		}

		.divisore {
			background-color: black;
			height: 50px;
		}

		.container__richieste {
			height: 300px;
			border: 3px solid red;
		}

		.footer {
			height: 400px;
		}
	</style>
	<title>Admin Page</title>
</head>

<body>
    <% 
    // faccio prima il cast
    String adminName = (String)session.getAttribute("NomeAdmin");
    %>


	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">

		<div class="w3-center">
			<h4>GLI EVENTI COME NON LI AVEVI MAI CERCATI...</h4>
			<h1 class="w3-xxxlarge">MERCURY</h1>
		</div>
	</header>

	<div class="welcome-bar">
		<h2 class="d-block m-auto">Benvenuta/o <%= adminName %></h2>
	</div>

	<div class="container__panoramica">
	</div>

	<div class="divisore"></div>

	<!-- CONTAINER RCHIESTE RICEVUTE -->
	<div class="container__richieste">
		<!-- Qui va connesso alla SERVLET e NON alla JSP -->
		<a href="Event_Servlet">Vedi gli eventi</a>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-theme-dark w3-padding-16 footer">
		<h3>Footer</h3>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

</body>

</html>