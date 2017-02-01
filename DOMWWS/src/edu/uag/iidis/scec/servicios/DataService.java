package edu.uag.iidis.scec.servicios;
import java.util.*;


public class DataService {
	private String pais;

	public DataService(String pais){
		this.pais = pais;
	}

	public String getPais(){
		return pais;
	}
	public void setPais(String pais){
		this.pais =  pais;
	}

	
}