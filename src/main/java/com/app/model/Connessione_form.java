package com.app.model;

import java.sql.*;
import java.sql.Connection;

public class Connessione_form {

	Connection connection;
	Statement st;
	String querySql;

//	inizializzo le variabili per il DB
	String urlDB = "jdbc:mysql://localhost:3306/mercury";
	String userName = "root";
	String password = "user_mysql_14";

//	ogni variabile per ogni colonna della tabella "evento"
	String nomeEvento;
	String dataEvento;
	String orarioEvento;
	String regioneEvento;
	String provinciaEvento;
	String comuneEvento;
	String descrizioneEvento;

	public void Inserimento_Dati_Form(String a, String b, String c, String d, String e, String f, String g) {

		this.nomeEvento = a;
		this.dataEvento = b;
		this.orarioEvento = c;
		this.regioneEvento = d;
		this.provinciaEvento = e;
		this.comuneEvento = f;
		this.descrizioneEvento = g;

//     verifico se il problema è il driver o meno
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

//			connessione al DB
			connection = DriverManager.getConnection(urlDB, userName, password);

//			Creo la query per l'inserimento

			String querySql = "INSERT INTO eventi VALUES(0, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(querySql);

//          lo "0" nella tabella eventi -> ID
			statement.setString(1, this.nomeEvento);
			statement.setString(2, this.dataEvento);
			statement.setString(3, this.orarioEvento);
			statement.setString(4, this.regioneEvento);
			statement.setString(5, this.provinciaEvento);
			statement.setString(6, this.comuneEvento);
			statement.setString(7, this.descrizioneEvento);

			// executeUpdate() ->
			statement.executeUpdate();

			System.out.println("Aggiornamento DB avvenuto");

			// chiudi la connessione
			connection.close();
			

		} catch (SQLException z) {

			z.printStackTrace();
			System.out.println("Errore");

		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}
		
		
	}

}
