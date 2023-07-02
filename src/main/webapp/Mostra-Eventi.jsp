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

<style>

/* SearchField */
.header {
	background-color: black;
	color: white;

	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.header__searchField {
	border: 3px solid rgb(0, 30, 255);
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;

	min-width: 350px;
}

.form-select {
	width: 200px;
}

.header__searchBtn {
	width: 100%;
	margin-top: 30px;
}

.container__ricerca {
	border: 3px solid red;
	

	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;

	margin: 20px 0;
}

/* Footer */

.footer {
	height: 500px;
}





/* CARDS */


.card__section {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 100%;
	height: 100%;
	border: 3px solid red;
	flex-wrap: wrap;
	row-gap: 20px;

	padding: 30px 20px;
}

.card__preview {
	background-color: wheat;

	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;

	background-color: wheat;
	border-radius: 20px;
	min-width: 300px;
	padding: 10px 20px;
	contain: content;
}

.card__title {
	font-weight: 600;
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

				<!-- FORM -->

				<form action="" id="searchForm">

					<!-- Menu a tendina Regione -->
					<div class="header__searchField">
						<label for="selectRegione">Regione:</label>
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
					</div>

					<!-- Menu a tendina Provincia -->
					<div class="header__searchField">
						<label for="selectProvincia">Provincia:</label>

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
					</div>

					<!-- Menu a tendina Comune -->
					<div class="header__searchField">
						<label for="selectComune">Comune:</label>

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

					
					<input type="submit" name="" id="search" value="cerca" class="btn btn-secondary header__searchBtn">
					

				</form>
			</div>
		</div>

		</div>
	</header>

	<div class="risultati">
		<h2>Risultati della ricerca:</h2>
	</div>

	<!-- Cards -->

	<div class="card__section">

		<%
		ArrayList<Eventi> event = new ArrayList<>();
		event = (ArrayList<Eventi>) request.getAttribute("admin-all");

		for (int i = 0; i < event.size(); i++) {

			out.println("<div class=\"card__preview\">");
			out.println("<h3 class=\"card__title\">" + event.get(i).getNomeEvento() + "</h3>");
			out.println("<div class=\"card__info\">");
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