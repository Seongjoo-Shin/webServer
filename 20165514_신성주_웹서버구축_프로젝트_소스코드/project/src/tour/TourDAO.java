package tour;

import java.sql.*;
import java.util.*;

public class TourDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public TourDAO() {
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
	
	public ArrayList<Tour> getTourList() {
		
		ArrayList<Tour> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("select name from tourism");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Tour tour = new Tour();
				
				tour.setTourism(rs.getString("name"));
				
				list.add(tour);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Tour> getAccommodationList() {
			
			ArrayList<Tour> list = new ArrayList<>();
			
			try {
				PreparedStatement pstmt = conn.prepareStatement("select name from Accommodation");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Tour tour = new Tour();
					
					tour.setAccommodation(rs.getString("name"));
					
					list.add(tour);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}

	public ArrayList<Tour> getRestaurantList() {
		
		ArrayList<Tour> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("select name from Restaurant");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Tour tour = new Tour();
				
				tour.setRestaurant(rs.getString("name"));
				
				list.add(tour);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
