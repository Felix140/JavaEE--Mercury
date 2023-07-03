package com.app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.app.model.InsertNewsletter;

public class Newsletter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emailUtente = request.getParameter("newsletter");
		
		InsertNewsletter x = new InsertNewsletter();
		x.Iscrizione_Newsletter(emailUtente);
		
	}

}
