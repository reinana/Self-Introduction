package com.sample;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable{
	private int id;
	private Date date;
	private String name;
	private String message;
	
	public Message() {	}
	
	public Message(int id, Date date, String name, String message) {
		super();
		this.id = id;
		this.date = date;
		this.name = name;
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}
