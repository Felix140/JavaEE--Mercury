<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ page import="java.util.ArrayList" %>
		<%@ page import="java.util.List" %>
			<%@ page import="com.app.model.EventiImplementation" %>
				<%@ page import="com.app.model.Eventi" %>


					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="ISO-8859-1">
						<title>Mostra Eventi</title>
					</head>

					<body>

						<% 
						ArrayList<Eventi> event = new ArrayList<>();
								event = (ArrayList<Eventi>)request.getAttribute("admin-all");

									for (int i = 0; i < event.size(); i++) { out.println(event.get(i).getNomeEvento());
										out.println(event.get(i).getDataEvento());
										out.println(event.get(i).getOrarioEvento());
										out.println(event.get(i).getRegioneEvento());
										out.println(event.get(i).getProvinciaEvento());
										out.println(event.get(i).getComuneEvento());
										out.println(event.get(i).getDescrizioneEvento()); } %>

					</body>

					</html>