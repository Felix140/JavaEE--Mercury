package com.app.controller;

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

		CheckLogin_Enti check = new CheckLogin_Enti();

		try {
			check.Controllo_Credenziali(enteEmail, entePassword);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("errore");
		}
	}

}