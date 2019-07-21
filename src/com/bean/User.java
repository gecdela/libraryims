package com.bean;

public class User {

	private String username;
	private String password;
	private String per;
	private int userid;
	private String head;
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	private String tel;
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPer() {
		return per;
	}
	public void setPer(String per) {
		this.per = per;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password
				+ ", per=" + per + ", userid=" + userid + ", head=" + head
				+ ", tel=" + tel + ", email=" + email + "]";
	}

	
	
	
}
