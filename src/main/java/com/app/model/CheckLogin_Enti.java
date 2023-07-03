package com.app.model;

import java.sql.*;

public class CheckLogin_Enti {

	private String url = "jdbc:mysql://localhost:3306/mercury";
	public Connection connect = null;
	String emailEnte;
	String passwordEnte;
	String nomeEnte;

	// Check delle credenziali di accesso
	public boolean Controllo_Credenziali(String enteEmail, String entePassword) throws SQLException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}

		connect = DriverManager.getConnection(url, "root", "user_mysql_14");
		Statement query = connect.createStatement();
		ResultSet result = query.executeQuery("Select*from enti");

		while (result.next()) {

			String email = result.getString("email");
			String password = result.getString("password");

			if (enteEmail.equals(email) && entePassword.equals(password)) {
				System.out.println("Accesso effettuato");
				System.out.println("Email: " + email);
				System.out.println("Password: " + password);
				
				return true;
				
			} else {
				System.out.println("Credenziali errate");
			}
		}
		connect.close();
		return false;
	}
	
//	Metodo per estrarre il nome dell'ente dalla tabella enti
	public String estraiNome(String enteEmail, String entePassword) throws SQLException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}
		
		connect = DriverManager.getConnection(url, "root", "user_mysql_14");
		Statement query = connect.createStatement();
		ResultSet result = query.executeQuery("SELECT * FROM enti WHERE email = '" + enteEmail + "' AND password = '" + entePassword + "'");
		
//		String email = result.getString("email");
//		String password = result.getString("password");
		
		if (result.next()) {
			nomeEnte = result.getString(2);
		} else {
			System.out.println("nome ente NON PRESENTE");
		}
		
		 connect.close();
		 
		 return nomeEnte;
		
	}
	
}
