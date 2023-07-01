<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="com.app.model.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<style>
h3 {
	font-weight: 600;
}
.footer {
	height: 500px;
}

.cerca__evento {
	display: flex;
	/* border: 3px solid white; */
	flex-direction: row;
	justify-content: space-between;
	width: 400px;
	margin: auto;
	margin-top: 40px;
}

.w3-center {
	padding: 50px;
}

.cards {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 100%;
	height: 100%;
	border: 3px solid red;
	flex-wrap: wrap;
	row-gap: 20px;
}


.w3-card {
	min-width: 300px;
	background-color: wheat;
}

.risultati {
	background-color: wheat;
	height: 100px;
}
</style>
<title>Mercury</title>
</head>

<body>

	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">

		<div class="w3-center">
			<h4>GLI EVENTI COME NON LI AVEVI MAI CERCATI...</h4>
			<h1 class="w3-xxxlarge">MERCURY</h1>

			<div class="cerca__evento ">
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">REGIONE</button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item" type="button">Action</button></li>
						<li><button class="dropdown-item" type="button">Another
								action</button></li>
						<li><button class="dropdown-item" type="button">Something
								else here</button></li>
					</ul>
				</div>

				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">
						PROVINCIA</button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item" type="button">Action</button></li>
						<li><button class="dropdown-item" type="button">Another
								action</button></li>
						<li><button class="dropdown-item" type="button">Something
								else here</button></li>
					</ul>
				</div>

				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">COMUNE</button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item" type="button">Action</button></li>
						<li><button class="dropdown-item" type="button">Another
								action</button></li>
						<li><button class="dropdown-item" type="button">Something
								else here</button></li>
					</ul>

				</div>
			</div>
		</div>
	</header>

	<div class="risultati">
		<h2>Risultati della ricerca:</h2>
		<nav></nav>
	</div>

	<nav></nav>

	<!-- Cards -->
	<div class="card__container w3-row-padding w3-center w3-margin-top">
		<div class="w3-third cards">

			<%
			ArrayList<Eventi> event = new ArrayList<>();
			event = (ArrayList<Eventi>) request.getAttribute("admin-all");

			for (int i = 0; i < event.size(); i++) {
				out.println("<div class=\"w3-card w3-container\">");
				out.println("<h3>" +  event.get(i).getNomeEvento() + "</h3>");
				out.println("<div class=\"info\">");
				out.println("<p>" + event.get(i).getDataEvento() + "</p>");
				out.println("<p>" + event.get(i).getOrarioEvento() + "</p>");
				out.println("<p>" + event.get(i).getRegioneEvento() + "</p>");
				out.println("<p>" + event.get(i).getProvinciaEvento() + "</p>");
				out.println("<p>" + event.get(i).getComuneEvento() + "</p>");
				out.println("<p>" + event.get(i).getDescrizioneEvento() + "</p>");
				out.println("</div>");
				out.println("</div>");
			}
			%>

		</div>
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-theme-dark w3-padding-16 footer">
		<h3>Footer</h3>
	</footer>

	<!-- Script for Sidebar, Tabs, Accordions, Progress bars and slideshows -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>

</body>

</html>