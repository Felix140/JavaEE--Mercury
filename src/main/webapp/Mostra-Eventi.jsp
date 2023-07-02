<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="com.app.model.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<!-- BOOTSTRAP -->
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

.header__buttons {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	column-gap: 20px;
	margin-top: 30px;
	border: 3px solid rgb(0, 187, 255);

}
.header__searchBtn {
	width: 200px;
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
	background-color: white;
	display: flex;
	flex-direction: column;
}

.risultati__cards {
	width: 100%;
	padding: 30px 20px;
	border: 3px solid rgb(0, 255, 204);

	display: flex;
	flex-direction: row;
	gap: 30px;
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
	display: flex;
	justify-content: center;
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
	background-color: #f5deb3;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;

	border-radius: 20px;
	width: 400px;
	min-height: 400px;

	padding: 40px 20px;
	overflow: hidden; /* Nasconde il testo che va oltre il contenitore in larghezza */

	background-image: linear-gradient(
	45deg,
	hsl(39deg 77% 83%) 0%,
	hsl(40deg 77% 84%) 11%,
	hsl(42deg 77% 85%) 22%,
	hsl(43deg 77% 86%) 33%,
	hsl(45deg 78% 87%) 44%,
	hsl(47deg 79% 88%) 56%,
	hsl(49deg 80% 89%) 67%,
	hsl(51deg 81% 90%) 78%,
	hsl(53deg 83% 91%) 89%,
	hsl(55deg 86% 92%) 100%
	);

	box-shadow: 0.6px 0.5px 1px hsl(0deg 0% 70% / 0.33),
	11.4px 8.2px 18px -1.4px hsl(0deg 0% 70% / 0.57);
	
}

.card__info {
	border: 2px solid red;
	width: 100%;
	overflow-y: auto;
}
.card__info p {
	overflow-wrap: anywhere; 
}

.card__title {
	font-weight: 600;
	word-wrap: break-word;
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
					<!-- Buttons -->
					<div class="header__buttons">
						<input type="reset" name="" id="reset" value="RESETTA" class="btn btn-secondary">
						<input type="submit" name="" id="search" value="CERCA EVENTO" class="btn btn-light header__searchBtn">
					</div>
				</form>
			</div>
		</div>
	</header>
	<!-- Risultati -->
	<div class="risultati">
		<div id="risultatiContainer" class="risultati__cards"></div>
	</div>
	<!-- Cards -->
	<div class="card__section">
		<h2 class="card__sectionTitle">Gli ultimi eventi aggiunti: </h2>
		<div class="card__container">
	
<!-- 	
			<div class="card__preview">
				<h3 class="card__title\">Titolo</h3>
				<div class="card__info">
					<p>Testo prova</p>
					<p>Testo prova</p>
					<p>Testo prova</p>
					<p>Testo prova</p>
					<p>Testo prova</p>
					<p>testo </p>
				</div>
			</div> -->



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
			// Variabile per tenere traccia dello stato del bottone
			var isButtonClicked = false;
	
			// Funzione per copiare la card corrispondente alle opzioni selezionate
			function copyCardToResults() {
				// Verifica se il bottone è già stato cliccato
				if (isButtonClicked) {
					return; // Esce dalla funzione se il bottone è già stato cliccato
				}
	
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
	
				// Imposta lo stato del bottone come cliccato
				isButtonClicked = true;
			}
	
			// Aggiungi un gestore di eventi al form per l'evento di submit
			$("#searchForm").submit(function (event) {
				event.preventDefault(); // Impedisce il submit predefinito del form
				copyCardToResults();
			});
	
			// Aggiungi un gestore di eventi al bottone di reset
			$("#reset").click(function () {
				// Resettare le opzioni selezionate
				$("#selectRegione").val("");
				$("#selectProvincia").val("");
				$("#selectComune").val("");
	
				// Rimuovi le card nel contenitore dei risultati
				var risultatiContainer = $("#risultatiContainer");
				risultatiContainer.empty();
	
				// Reimposta lo stato del bottone come non cliccato
				isButtonClicked = false;
			});
	
		});
	</script>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>

</html>