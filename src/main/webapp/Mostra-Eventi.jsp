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

.header {
	background-color: black;
	color: white;

	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.container__ricerca {
	border: 3px solid red;
	width: 300px;

	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;

	margin: 20px 0;
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

.footer {
	background-color: black;
	color: white;
}
</style>

<title>Mercury</title>
</head>

<body>

	<!-- Header -->
	<header>

		<div class="header">
			<h4>GLI EVENTI COME NON LI AVEVI MAI CERCATI...</h4>
			<h1 class="title">MERCURY</h1>

			<div class="container__ricerca mt-5">
				<h4>Cerca il luogo dell'evento</h4>

				<!-- Menu a tendina Regione -->
				<select class="form-select mt-3" id="selectRegione"
					aria-label="Seleziona Regione">
					<option default>Regione</option>
					<!-- Seleziona unica regione -->
					<%
					Set<String> regioniUniche = new HashSet<>();

					ArrayList<Eventi> regione = new ArrayList<>();

					regione = (ArrayList<Eventi>) request.getAttribute("admin-all");

					for (int i = 0; i < regione.size(); i++) {
						regioniUniche.add(regione.get(i).getRegioneEvento());
					}

					for (String regioneUnica : regioniUniche) {
						out.println("<option>" + regioneUnica + "</option>");
					}
					%>
				</select>

				<!-- Menu a tendina Provincia -->
				<select class="form-select mt-3" id="selectProvincia"
					aria-label="Seleziona Provincia">
					<option default>Provincia</option>
					<%
					Set<String> provinceUniche = new HashSet<>();

					ArrayList<Eventi> provincia = new ArrayList<>();

					provincia = (ArrayList<Eventi>) request.getAttribute("admin-all");

					for (int i = 0; i < provincia.size(); i++) {
						provinceUniche.add(provincia.get(i).getProvinciaEvento());
					}

					for (String provinciaUnica : provinceUniche) {
						out.println("<option>" + provinciaUnica + "</option>");
					}
					%>
				</select>

				<!-- Menu a tendina Comune -->
				<select class="form-select mt-3" id="selectComune"
					aria-label="Seleziona Comune">
					<option default>Comune</option>
					<%
					Set<String> comuniUnici = new HashSet<>();

					ArrayList<Eventi> comune = new ArrayList<>();

					comune = (ArrayList<Eventi>) request.getAttribute("admin-all");

					for (int i = 0; i < comune.size(); i++) {
						comuniUnici.add(comune.get(i).getComuneEvento());
					}

					for (String comuneUnico : comuniUnici) {
						out.println("<option>" + comuneUnico + "</option>");
					}
					%>
				</select>



			</div>


		</div>


		</div>
	</header>

	<div class="risultati">
		<h2>Risultati della ricerca:</h2>
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
				out.println("<h3>" + event.get(i).getNomeEvento() + "</h3>");
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
	<footer class="footer">
		<h3>Footer</h3>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>

</html>