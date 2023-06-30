package com.app.controller;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


// importo la classe Connessione_form
import com.app.model.*;



/**
 * Servlet implementation class Creazione_Form
 */
public class CreazioneForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		PrintWriter print = response.getWriter();

		String nomeEvento = request.getParameter("Nome_Evento");
		String dataEvento = request.getParameter("Data_Evento");
		String orarioEvento = request.getParameter("Ora_Evento");
		String regioneEvento = request.getParameter("Regione_Evento");
		String provinciaEvento = request.getParameter("Provincia_Evento");
		String comuneEvento = request.getParameter("Comune_Evento");
		String descrizioneEvento = request.getParameter("Descrizione_Evento");

//		creazione oggetto della connessione Form
		Connessione_form formConnection = new Connessione_form();

		formConnection.Inserimento_Dati_Form(nomeEvento, dataEvento, orarioEvento, regioneEvento, provinciaEvento,
				comuneEvento, descrizioneEvento);

	}

}