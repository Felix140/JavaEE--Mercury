package com.app.model;

import java.util.ArrayList;
import java.sql.*;

public class EventiImplementation {

	String urlDB = "jdbc:mysql://localhost:3306/mercury";
	String userName = "root";
	String password = "RootPass";
	

	// inizializzo l'array
	private ArrayList<Eventi> arr = new ArrayList<>();

	public ArrayList<Eventi> getAll() {
		
		

		try {
			Class.forName("com.mysql.jdbc.Driver");
			 
			Connection conn = DriverManager.getConnection(urlDB, userName, password);
			
			Statement statement = conn.createStatement();
			String query = "SELECT * FROM eventi";
			ResultSet result = statement.executeQuery(query);
			
			while (result.next()) {
				
				Eventi ev = new Eventi();
				
				ev.setNomeEvento(result.getString("Nome_Evento"));
				ev.setDataEvento(result.getString("Data_Evento"));
				ev.setOrarioEvento(result.getString("Orario_Evento"));
				ev.setRegioneEvento(result.getString("Regione"));
				ev.setProvinciaEvento(result.getString("Provincia"));
				ev.setComuneEvento(result.getString("Comune"));
				ev.setDescrizioneEvento(result.getString("Descrizione"));
				
				// aggiungio all' array i dati estratti
				arr.add(ev);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			System.out.println("Driver non trovato");
		}
		return arr;
		
	}
}
