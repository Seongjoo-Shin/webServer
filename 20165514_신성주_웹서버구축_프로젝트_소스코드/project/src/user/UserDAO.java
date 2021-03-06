package user;

import java.sql.*;

public class UserDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/project";
			String user = "root";
			String pwd = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pwd);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String passwd) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select passwd from member where id=?");
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1).equals(passwd)? 1 : 0;
			}
			else {
				return -2;
			}
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean ID_Check(String id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from member where id=?");
			
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return false;
			}
			else {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int register(User user) {
		if(!ID_Check(user.getUser_id())) return 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?)");
			
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pwd());
			pstmt.setString(3, user.getUser_pwd_check());
			pstmt.setString(4, user.getUser_nick());
			pstmt.setString(5, user.getUser_city());
			return pstmt.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
			return -1;
		}
	}
	
	public User getUser(String id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from member where id=?");
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				User user = new User();
				user.setUser_id(rs.getString(1));
				user.setUser_pwd(rs.getString(2));
				user.setUser_pwd_check(rs.getString(3));
				user.setUser_nick(rs.getString(4));
				user.setUser_city(rs.getString(5));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
