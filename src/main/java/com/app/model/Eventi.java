package com.app.model;


public class Eventi {
	
	private String nomeEvento;
	private String dataEvento;
	private String orarioEvento;
	private String regioneEvento;
	private String provinciaEvento;
	private String comuneEvento;
	private String descrizioneEvento;
	
	public String getNomeEvento() {
		return nomeEvento;
	}
	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}

	public String getDataEvento() {
		return dataEvento;
	}
	public void setDataEvento(String dataEvento) {
		this.dataEvento = dataEvento;
	}
	
	public String getOrarioEvento() {
		return orarioEvento;
	}
	public void setOrarioEvento(String orarioEvento) {
		this.orarioEvento = orarioEvento;
	}
	
	public String getRegioneEvento() {
		return regioneEvento;
	}
	public void setRegioneEvento(String regioneEvento) {
		this.regioneEvento = regioneEvento;
	}
	
	public String getProvinciaEvento() {
		return provinciaEvento;
	}
	public void setProvinciaEvento(String provinciaEvento) {
		this.provinciaEvento = provinciaEvento;
	}
	
	public String getComuneEvento() {
		return comuneEvento;
	}
	public void setComuneEvento(String comuneEvento) {
		this.comuneEvento = comuneEvento;
	}
	
	public String getDescrizioneEvento() {
		return descrizioneEvento;
	}
	public void setDescrizioneEvento(String descrizioneEvento) {
		this.descrizioneEvento = descrizioneEvento;
	}

//	Creo il costruttore
	public Eventi()
	{
		super();
	}

}
