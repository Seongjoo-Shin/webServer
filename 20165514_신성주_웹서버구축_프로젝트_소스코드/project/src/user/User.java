package user;

import java.sql.*;

public class User {
	
	private String user_id;
	private String user_pwd;
	private String user_pwd_check;
	private String user_nick;
	private String user_city;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_pwd_check() {
		return user_pwd_check;
	}
	public void setUser_pwd_check(String user_pwd_check) {
		this.user_pwd_check = user_pwd_check;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_city() {
		return user_city;
	}
	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}
}
