package com.app.model;

import java.sql.*;

public class CheckLogin_Admin {
	private String url = "jdbc:mysql://localhost:3306/mercury";
	public Connection connect = null;
	
	String nomeAdmin;
	String passwordAdmin;
	
	public boolean Controllo_Credenziali(String nomeAdmin, String passwordAdmin) throws SQLException {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}
		
		
		connect = DriverManager.getConnection(url, "root", "user_mysql_14");
		Statement query = connect.createStatement();
		ResultSet result = query.executeQuery("Select*from admin");
		
		
		
		while (result.next()) {

			String admin = result.getString("nome_admin");
			String password = result.getString("password");

			if (nomeAdmin.equals(admin) && passwordAdmin.equals(password)) {
				System.out.println("Accesso effettuato come Amministratore");
				System.out.println("Nome: " + admin);
				System.out.println("Password: " + password);
				
				return true;

			} else {
				System.out.println("Credenziali errate");
			}
		}

		connect.close();
		return false;
	}	
}
