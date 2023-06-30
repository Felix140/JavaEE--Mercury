package com.app.model;

import java.sql.*;
import java.sql.Connection;

public class Connessione_form {
	Connection connection;
	Statement st;
	String querySql;

//	inizializzo le variabili
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

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			System.out.println("Non trovo la classe Driver");
		}

//		uso ora il TRY-CATCH

		try {
//			connessione al DB

			String urlDB = "jdbc:mysql://localhost:3306/mercury";
			String userName = "root";
			String password = "RootPass";

			connection = DriverManager.getConnection(urlDB, userName, password);

//			Creo la query per l'inserimento

			String querySql = "INSERT INTO eventi VALUES(0, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(querySql);

//          lo "0" nella tabella eventi -> ID
//			Nome evento
			statement.setString(1, this.nomeEvento);
//			data evento
			statement.setString(2, this.dataEvento);
//			orario evento
			statement.setString(3, this.orarioEvento);
//			regione evento
			statement.setString(4, this.regioneEvento);
//			provincia evento
			statement.setString(5, this.provinciaEvento);
//			comune evento
			statement.setString(6, this.comuneEvento);
//			descrizione evento
			statement.setString(7, this.descrizioneEvento);

			// executeUpdate() ->
			statement.executeUpdate();

			System.out.println("Aggiornamento DB avvenuto");

			// chiudi la connessione
			connection.close();

		} catch (SQLException z) {

			z.printStackTrace();
			System.out.println("Errore");

		}
	}

}
