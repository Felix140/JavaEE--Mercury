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

import com.app.model.CheckLogin_Admin;

public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String adminName = request.getParameter("Nome_Admin");
		String adminPass = request.getParameter("Password");
		
		
		CheckLogin_Admin checkAdmin = new CheckLogin_Admin(); 
		HttpSession session = request.getSession();
		
		
		try {
			boolean checkConfirmed = checkAdmin.Controllo_Credenziali(adminName, adminPass);
			if (checkConfirmed) {
				// Spedisci
				RequestDispatcher dispatch = request.getRequestDispatcher("admin-page.jsp");
				session.setAttribute("NomeAdmin", adminName);
				dispatch.forward(request, response);
			} else {
				
				response.sendRedirect("admin-login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Errore servlet");
		}
	}
}
