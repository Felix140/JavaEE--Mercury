<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Form Events</title>
		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

		<!-- w3 school -->
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			.hero__title {
				font-weight: 700;
			}

			.container-form {
				width: 100%;
			}

			.form {
				width: 500px;
				margin: 0 auto;
				padding: 30px 0;
			}



			.container__preview {
				display: flex;
				width: 100%;
				flex-direction: column;
				justify-content: center;

				margin: 40px 0;

				border: 3px solid red;
			}

			.title__preview {
				display: flex;
				justify-content: center;
			}

			.card__preview {
				display: flex;


				background-color: wheat;
				border-radius: 20px;
				width: 400px;

				margin: 0 auto;
				padding: 10px 20px;
			}
			
			.container__richieste {
			height: 300px;
			border: 3px solid red;
			}


			.buttons {
				display: flex;
				border: 3px solid rgb(64, 0, 255);
				justify-content: center;
				column-gap: 20px;

			}
		</style>


		<!-- Aggiungi script JavaScript per la preview -->
		<script>
			// Funzione per aggiornare la preview live
			function updatePreview(inputElement, previewElementId) {
				var value = inputElement.value;
				document.getElementById(previewElementId).textContent = value;
			}
		</script>

	</head>

	<body>

		<!-- Header -->
		<header class="w3-container w3-theme w3-padding" id="myHeader">

			<div class="w3-center">
				<h4>GLI EVENTI COME NON LI AVEVI MAI CERCATI...</h4>
				<h1 class="w3-xxxlarge hero__title">MERCURY</h1>
			</div>
		</header>

		<div class="container-form">

			<h3 class="text-center fw-bold ">INSERISCI I DATI DEL TUO EVENTO!</h3>

			<!-- FORM -->
			<form action="CreazioneForm" method="post" class="form">

				<!-- Nome evento -->
				<div class="mb-3 form-floating">
					<input type="text" class="form-control" name="Nome_Evento" id="Nome_Evento"
						placeholder="nome-evento">
					<label for="nome">Nome dell'evento</label>
				</div>

				<!-- Data evento -->
				<div class="mb-3 ">
					<label for="email"> Data Evento </label>
					<input type="date" class="form-control" name="Data_Evento" id="email" placeholder="Inserisci la ">
				</div>

				<!-- Orario -->
				<div class="mb-3">
					<label for="password" class="form-label">Ora dell'evento</label>
					<input type="time" class="form-control" name="Ora_Evento" id="password"
						placeholder="Inserisci la tua password">
				</div>

				<!-- Regione -->
				<div class="mb-3 form-floating">
					<input class="form-control" id="regione" name="Regione_Evento" rows="3"
						placeholder="Inserisci la regione dell'evento"></input>
					<label for="regione" class="form-label">Regione dell'evento</label>
				</div>

				<!-- Provincia -->
				<div class="mb-3 form-floating">
					<input class="form-control" id="provincia" name="Provincia_Evento" rows="3"
						placeholder="Inserisci la provincia dell'evento"></input>
					<label for="provincia" class="form-label">Provincia
						dell'evento</label>
				</div>

				<!-- Comune -->
				<div class="mb-3 form-floating">
					<input class="form-control" id="comune" name="Comune_Evento" rows="3"
						placeholder="Inserisci il comune dell'evento"></input>
					<label for="comune" class="form-label">Comune dell'evento</label>
				</div>

				<!-- Descrizione -->
				<div class="mb-3">
					<label for="descrizione" class="form-label">Descrizione
						dell'evento</label>
					<textarea class="form-control" id="descrizione" name="Descrizione_Evento" rows="3"
						placeholder="Inserisci una descrizione dell'evento (max 150 caratteri)" style="resize: none;" maxlength="150"></textarea>
				</div>

				<!-- Preview -->
				<div class="container__preview">
					<h2 class="title__preview">Preview</h2>
					<div class="card__preview">
						<div class="w3-third cards">
							<h3 id="previewNomeEvento">Title</h3>
							<div class="info">
								<p>Data: <span id="previewDataEvento"></span></p>
								<p>Orario: <span id="previewOraEvento"></span></p>
								<p>Regione: <span id="previewRegioneEvento"></span></p>
								<p>Provincia: <span id="previewProvinciaEvento"></span></p>
								<p>Comune: <span id="previewComuneEvento"></span></p>
								<p>Descrizione: <span id="previewDescrizioneEvento"></span></p>
							</div>
						</div>
					</div>
				</div>

				<!-- Invia Form -->
				<div class="buttons">
					<button type="reset" class="btn btn-light">Resetta Form</button>
					<button type="submit" class="btn btn-primary">Pubblica l'evento</button>
				</div>
		
			</form>

		<!-- CONTAINER RCHIESTE RICEVUTE -->
		<div class="container__richieste">
			<!-- Qui va connesso alla SERVLET e NON alla JSP -->
			<a href="Event_Servlet">Vedi gli eventi</a>
		</div>


	</div>

		<!-- Footer -->
		<footer class="w3-container w3-theme-dark w3-padding-16 footer">
			<h3>Footer</h3>
		</footer>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
			crossorigin="anonymous"></script>


		<!-- Aggiungi event listener per gli input per chiamare la funzione di aggiornamento -->
		<script>
			// Aggiungi event listener per gli input per chiamare la funzione di aggiornamento
			document.getElementById("Nome_Evento").addEventListener("input", function () {
				updatePreview(this, "previewNomeEvento");
			});
			document.getElementById("email").addEventListener("input", function () {
				updatePreview(this, "previewDataEvento");
			});
			document.getElementById("password").addEventListener("input", function () {
				updatePreview(this, "previewOraEvento");
			});
			document.getElementById("regione").addEventListener("input", function () {
				updatePreview(this, "previewRegioneEvento");
			});
			document.getElementById("provincia").addEventListener("input", function () {
				updatePreview(this, "previewProvinciaEvento");
			});
			document.getElementById("comune").addEventListener("input", function () {
				updatePreview(this, "previewComuneEvento");
			});
			document.getElementById("descrizione").addEventListener("input", function () {
				updatePreview(this, "previewDescrizioneEvento");
			});

		</script>


	</body>

	</html>