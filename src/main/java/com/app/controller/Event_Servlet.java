package com.app.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.app.model.*;



public class Event_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EventiImplementation evimp = new EventiImplementation();
		
		ArrayList<Eventi> event = new ArrayList<>();
		event = evimp.getAll();

		request.setAttribute("admin-all", event);
		
//		Qui ci richiamo il file INDEX
		RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
		dispatch.forward(request, response); 
	}
}
