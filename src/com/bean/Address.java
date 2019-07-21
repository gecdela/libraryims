package com.bean;


public class Address {

	private int id;
	private String name;
	private String tel;
	private String region;
	private int userid;
	
	
	
	public Address(int id, String name, String tel, String region, int userid) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.region = region;
		this.userid = userid;
	}
	public Address() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	
	
	
	
	
}
