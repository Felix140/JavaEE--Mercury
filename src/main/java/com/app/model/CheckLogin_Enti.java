package com.app.model;

import java.sql.*;

public class CheckLogin_Enti {

	private String url = "jdbc:mysql://localhost:3306/mercury";
	public Connection connect = null;

	String emailEnte;
	String passwordEnte;

	public void Controllo_Credenziali(String enteEmail, String entePassword) throws SQLException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}

		connect = DriverManager.getConnection(url, "root", "RootPass");
		Statement query = connect.createStatement();
		ResultSet result = query.executeQuery("Select*from enti");

		while (result.next()) {

			String email = result.getString("email");
			String password = result.getString("password");

			if (enteEmail.equals(email) && entePassword.equals(password)) {
				System.out.println("Accesso effettuato");
				System.out.println("Email: " + email);
				System.out.println("Password: " + password);

			} else {
				System.out.println("Credenziali errate");
			}
		}
		connect.close();
	}
}
