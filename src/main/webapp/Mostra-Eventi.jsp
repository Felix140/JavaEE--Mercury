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
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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

/* Risultati */

.risultati {
	background-color: rgb(255, 200, 97);
	min-height: 300px;
	display: flex;
	flex-direction: column;
}

.risultati__cards {
	width: 100%;
	padding: 30px 20px;
	border: 3px solid rgb(0, 255, 204);
	flex-wrap: wrap;
}



/* CARDS */

.card__section {
	display: flex;
	flex-direction: column;
	justify-content: start;
	align-items: center;
	width: 100%;
	border: 3px solid red;
}

.card__sectionTitle {
	border: 2px solid blue;
	width: 100%;
}

.card__container {
	width: 100%;
	padding: 30px 20px;
	border: 3px solid rgb(0, 255, 204);

	display: flex;
	flex-direction: row;
	gap: 30px;
	flex-wrap: wrap;

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

/* Footer */

.footer {
	background-color: black;
	color: white;
	height: 300px;
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
						<select class="form-select mt-3" id="selectRegione" aria-label="Seleziona Regione">
								<option value="">Regione</option>
								<!-- Seleziona unica regione -->
								<%
								Set<String> regioniUniche = new HashSet<>();
								ArrayList<Eventi> regione = (ArrayList<Eventi>) request.getAttribute("admin-all");
								for (int i = 0; i < regione.size(); i++) {
									regioniUniche.add(regione.get(i).getRegioneEvento());
								}
								for (String regioneUnica : regioniUniche) {
									out.println("<option value=\"" + regioneUnica + "\">" + regioneUnica + "</option>");
								}
								%>
						</select>
					</div>
					<!-- Menu a tendina Provincia -->
					<div class="header__searchField">
						<label for="selectProvincia">Provincia:</label>
						<select class="form-select mt-3" id="selectProvincia" aria-label="Seleziona Provincia">
								<option value="">Provincia</option>
								<%
								Set<String> provinceUniche = new HashSet<>();
								ArrayList<Eventi> provincia = (ArrayList<Eventi>) request.getAttribute("admin-all");
								for (int i = 0; i < provincia.size(); i++) {
									provinceUniche.add(provincia.get(i).getProvinciaEvento());
								}
								for (String provinciaUnica : provinceUniche) {
									out.println("<option value=\"" + provinciaUnica + "\">" + provinciaUnica + "</option>");
								}
								%>
						</select>
					</div>
					<!-- Menu a tendina Comune -->
					<div class="header__searchField">
						<label for="selectComune">Comune:</label>
						<select class="form-select mt-3" id="selectComune" aria-label="Seleziona Comune">
								<option value="">Comune</option>
								<%
								Set<String> comuniUnici = new HashSet<>();
								ArrayList<Eventi> comune = (ArrayList<Eventi>) request.getAttribute("admin-all");
								for (int i = 0; i < comune.size(); i++) {
									comuniUnici.add(comune.get(i).getComuneEvento());
								}
								for (String comuneUnico : comuniUnici) {
									out.println("<option value=\"" + comuneUnico + "\">" + comuneUnico + "</option>");
								}
								%>
						</select>
					</div>
					<input type="submit" name="" id="search" value="cerca" class="btn btn-secondary header__searchBtn">
				</form>
			</div>
		</div>
	</header>
	<!-- Risultati -->
	<div class="risultati">
		<h2>Risultati della ricerca:</h2>
		<div id="risultatiContainer" class="risultati__cards"></div>
	</div>
	<!-- Cards -->
	<div class="card__section">
		<h2 class="card__sectionTitle">Gli ultimi eventi aggiunti: </h2>
		<div class="card__container">
			<%
			ArrayList<Eventi> event = (ArrayList<Eventi>) request.getAttribute("admin-all");
			for (int i = 0; i < event.size(); i++) {
				out.println("<div class=\"card__preview\">");
				out.println("<h3 class=\"card__title\">" + event.get(i).getNomeEvento() + "</h3>");
				out.println("<div class=\"card__info\">");
				out.println("<p data-property=\"regione\">" + event.get(i).getRegioneEvento() + "</p>");
				out.println("<p data-property=\"provincia\">" + event.get(i).getProvinciaEvento() + "</p>");
				out.println("<p data-property=\"comune\">" + event.get(i).getComuneEvento() + "</p>");
				out.println("<p>" + event.get(i).getDataEvento() + "</p>");
				out.println("<p>" + event.get(i).getOrarioEvento() + "</p>");
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
	<script>
		$(document).ready(function () {
			// Funzione per copiare la card corrispondente alle opzioni selezionate
			function copyCardToResults() {
				var selectedRegione = $("#selectRegione").val();
				var selectedProvincia = $("#selectProvincia").val();
				var selectedComune = $("#selectComune").val();
				// Trova la card corrispondente alle opzioni selezionate
				var matchingCards = $(".card__preview").filter(function () {
					var regione = $(this).find("p[data-property='regione']").text();
					var provincia = $(this).find("p[data-property='provincia']").text();
					var comune = $(this).find("p[data-property='comune']").text();
					return (
						selectedRegione === "" || regione === selectedRegione ||
						selectedProvincia === "" || provincia === selectedProvincia ||
						selectedComune === "" || comune === selectedComune
					);
				});
				// Aggiungi le card corrispondenti al contenitore dei risultati
				var risultatiContainer = $("#risultatiContainer");
				risultatiContainer.empty(); // Rimuovi le card precedenti
				if (matchingCards.length > 0) {
					risultatiContainer.append(matchingCards.clone());
				}
			}
			// Aggiungi un gestore di eventi al form per l'evento di submit
			$("#searchForm").submit(function (event) {
				event.preventDefault(); // Impedisce il submit predefinito del form
				copyCardToResults();
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>

</html>