package com.app.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
//import java.io.PrintWriter;

import com.app.model.*;

/**
 * Servlet implementation class RegistrazioneEnti
 */
public class RegistrazioneEnti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		PrintWriter print = response.getWriter();
		HttpSession session = request.getSession();

		String enteNome = request.getParameter("ente_nome");
		String enteEmail = request.getParameter("ente_email");
		String entePassword = request.getParameter("Password");
		
		
		Registrazione_Enti x = new Registrazione_Enti();
		
		boolean regEntiConfirmed = x.Inserimento_Credenziali_Enti(enteNome, enteEmail, entePassword);
		
		if (regEntiConfirmed) {
			RequestDispatcher dispatch = request.getRequestDispatcher("Enti-Login.html");
			dispatch.forward(request, response);
		} else {
			response.sendRedirect("enti-registration.html");
		}
	}

}
