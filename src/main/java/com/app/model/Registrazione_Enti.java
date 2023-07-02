package com.app.model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Registrazione_Enti {
	
	Connection connection;
	Statement st;
	String querySql;

	String enteNome;
	String enteEmail;
	String entePassword;

	public boolean Inserimento_Credenziali_Enti(String a, String b, String c) {
		this.enteNome = a;
		this.enteEmail = b;
		this.entePassword = c;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}
		
		
		try {
		
//			connessione al DB

			String urlDB = "jdbc:mysql://localhost:3306/mercury";
			String userName = "root";
			String password = "user_mysql_14";

			connection = DriverManager.getConnection(urlDB, userName, password);

//			Creo la query per l'inserimento

			String querySql = "INSERT INTO enti VALUES(0, ?, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(querySql);

			statement.setString(1, this.enteNome);
			statement.setString(2, this.enteEmail);
			statement.setString(3, this.entePassword);


			// executeUpdate() ->
			statement.executeUpdate();

			System.out.println("registrazione al DB avvenuta");
			

			// chiudi la connessione
			connection.close();
			
			return true;

		} catch (SQLException z) {

			z.printStackTrace();
			System.out.println("Errore");

		}
		return false;

	}

}
