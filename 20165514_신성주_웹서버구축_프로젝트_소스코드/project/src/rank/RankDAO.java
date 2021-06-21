package rank;

import java.sql.*;

import post.Comment;

public class RankDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public RankDAO() {
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
	
	public int write(String user_id, String num1, String num2, String num3, String num4, String num5) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into ranking values(?,?,?,?,?,?)");
			pstmt.setString(1, user_id);
			pstmt.setString(2, num1);
			pstmt.setString(3, num2);
			pstmt.setString(4, num3);
			pstmt.setString(5, num4);
			pstmt.setString(6, num5);
			
			PreparedStatement pstmt1 = conn.prepareStatement("update tourism set cnt=cnt+1 where name=?");
			pstmt1.setString(1, num1);
			pstmt1.executeUpdate();
			pstmt1.setString(1, num2);
			pstmt1.executeUpdate();
			pstmt1.setString(1, num3);
			pstmt1.executeUpdate();
			pstmt1.setString(1, num4);
			pstmt1.executeUpdate();
			pstmt1.setString(1, num5);
			pstmt1.executeUpdate();
			
			PreparedStatement pstmt2 = conn.prepareStatement("update restaurant set cnt=cnt+1 where name=?");
			pstmt2.setString(1, num1);
			pstmt2.executeUpdate();
			pstmt2.setString(1, num2);
			pstmt2.executeUpdate();
			pstmt2.setString(1, num3);
			pstmt2.executeUpdate();
			pstmt2.setString(1, num4);
			pstmt2.executeUpdate();
			pstmt2.setString(1, num5);
			pstmt2.executeUpdate();
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
}
