package post;

import java.sql.*;
import java.util.*;

public class PostDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public PostDAO() {
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
	
	public String getDate() {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select now()");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select post_id from post order by post_id desc");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String post_title, String user_id, String post_content) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into post values(?, ?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, getNext());
			pstmt.setString(2, post_title);
			pstmt.setString(3, user_id);
			pstmt.setString(4, post_content);
			pstmt.setInt(5, 1);
			pstmt.setString(6, getDate());
			pstmt.setInt(7, 0);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Post> getList(int pageNumber){
		ArrayList<Post> list = new ArrayList<Post>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from post where post_id < ? and post_available = 1 order by post_id desc limit 10");
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setPost_id(rs.getInt(1));
				post.setPost_title(rs.getString(2));
				post.setUser_id(rs.getString(3));
				post.setPost_content(rs.getString(4));
				post.setPost_available(rs.getInt(5));
				post.setPost_date(rs.getString(6));

				list.add(post);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String sql = "select * from post where post_id < ? and post_available = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Post getPost(int post_id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from post where post_id=?");
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Post post = new Post();
				post.setPost_id(rs.getInt(1));
				post.setPost_title(rs.getString(2));
				post.setUser_id(rs.getString(3));
				post.setPost_content(rs.getString(4));
				post.setPost_available(rs.getInt(5));
				post.setPost_date(rs.getString(6));
				post.setLiked(rs.getInt(7));
				return post;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Comment getPost_id(int post_id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from comment where post_id=?");
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Comment comm = new Comment();
				comm.setComment_id(rs.getString(1));
				comm.setComment_content(rs.getString(2));
				comm.setComment_grub(rs.getInt(3));
				comm.setComment_lev(rs.getInt(4));
				comm.setComment_date(rs.getString(5));
				comm.setPost_id(rs.getInt(6));
				
				return comm;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int post_id, String post_title, String post_content) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("update post set post_title = ? , post_content = ? where post_id = ?");
			pstmt.setString(1, post_title);
			pstmt.setString(2, post_content);
			pstmt.setInt(3, post_id);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int post_id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("update post set post_available = 0 where post_id = ?");
			pstmt.setInt(1, post_id);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int liked(int post_id) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("update post set liked = liked + 1 where post_id = ?");
			pstmt.setInt(1, post_id);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public int commentinsert(Comment comment) {
		int comment_cnt = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select count(comment_lev) from comment where comment_grub=?");
			pstmt.setInt(1, comment.getComment_grub());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				comment_cnt = rs.getInt(1)+1;
			}
			else {
				comment_cnt = 1;
			}
			
			pstmt = conn.prepareStatement("insert into comment values(?,?,?,?,now(),?)");
			pstmt.setString(1, comment.getComment_id());
			pstmt.setString(2, comment.getComment_content());
			pstmt.setInt(3, comment.getComment_grub());
			pstmt.setInt(4, comment_cnt);
			pstmt.setInt(5, comment.getPost_id());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Comment> getComment(int num){
		
		ArrayList<Comment> comment_bean = new ArrayList<>();
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement("select * from comment where post_id = " + num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setComment_id(rs.getString("comment_id"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setComment_grub(rs.getInt("comment_grub"));
				comment.setComment_lev(rs.getInt("comment_lev"));
				comment.setComment_date(rs.getString("comment_date"));
				comment_bean.add(comment);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return comment_bean;
	}
	
	public Comment getComment_lev(int comment_lev) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from comment where comment_lev=?");
			pstmt.setInt(1, comment_lev);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Comment comm = new Comment();
				comm.setComment_id(rs.getString(1));
				comm.setComment_content(rs.getString(2));
				comm.setComment_grub(rs.getInt(3));
				comm.setComment_lev(rs.getInt(4));
				comm.setComment_date(rs.getString(5));
				return comm;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int deleteComment(int comment_lev) {
		try {
			
			PreparedStatement pstmt = conn.prepareStatement("delete from comment where comment_grub=0 and comment_lev=?");
			pstmt.setInt(1, comment_lev);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
