package com.app.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertNewsletter {
	
	Connection connection;
	Statement st;
	String querySql;
	
	String emailUtente;
	
	public void Iscrizione_Newsletter(String a) {
		
//		assegno il valore preso dalla servlet "a" a emailUtente
		this.emailUtente = a;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}
		
		try {
			

			String urlDB = "jdbc:mysql://localhost:3306/mercury";
			String userName = "root";
			String password = "user_mysql_14";

			connection = DriverManager.getConnection(urlDB, userName, password);


			String querySql = "INSERT INTO mercury.newsletter VALUES(0, ?);";
			
			PreparedStatement statement = connection.prepareStatement(querySql);

			statement.setString(1, this.emailUtente);

			statement.executeUpdate();

			System.out.println("registrazione alla newsletter avvenuta");
			
			connection.close();

		} catch (SQLException z) {

			z.printStackTrace();
			System.out.println("Errore");

		}
		
	}

}
