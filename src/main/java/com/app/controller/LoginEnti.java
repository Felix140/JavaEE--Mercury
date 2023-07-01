package com.app.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import com.app.model.CheckLogin_Enti;

public class LoginEnti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String enteEmail = request.getParameter("ente_email");
		String entePassword = request.getParameter("Password");

//		faccio la verifica dell' email e della password con questo oggetto
		CheckLogin_Enti checkUser = new CheckLogin_Enti();

		// SESSION = prima crei l'oggetto session, poi lo setti dove ti serve, e poi lo
		// richiami nella pagina dove ti serve

		HttpSession session = request.getSession();

		try {

			boolean checkConfirmed = checkUser.Controllo_Credenziali(enteEmail, entePassword);

			if (checkConfirmed) {
				// Spedisci
				RequestDispatcher dispatch = request.getRequestDispatcher("form-eventi.jsp");
				session.setAttribute("loginUserEmail", enteEmail);
				session.setAttribute("loginUserPass", entePassword);
				dispatch.forward(request, response);
			} else {
				response.sendRedirect("Enti-Login.html");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("errore");
		}

	}

}