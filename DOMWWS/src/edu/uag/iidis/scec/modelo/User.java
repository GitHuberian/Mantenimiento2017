package edu.uag.iidis.scec.modelo;

import java.io.Serializable;
import java.util.*;

public class User extends ClaseBase 
        implements Serializable {
			
	private String username;
	private String userid;

	public User() {

	}

	public User(String username) {
		this.username = username;
	}
	public User(String username, String userid) {
		this.username = username;
		this.userid = userid;
	}
	
 
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}


}
