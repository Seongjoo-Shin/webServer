package post;

public class Comment {
	private String comment_id;
	private String comment_content;
	private int comment_grub;
	private int comment_lev;
	private String comment_date;
	private int post_id;
	
	public Comment() {}
	
	public Comment(String comment_id, String comment_content, String comment_date, int post_id) {
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.post_id = post_id;
	}
	
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getComment_grub() {
		return comment_grub;
	}
	public void setComment_grub(int comment_grub) {
		this.comment_grub = comment_grub;
	}
	public int getComment_lev() {
		return comment_lev;
	}
	public void setComment_lev(int comment_lev) {
		this.comment_lev = comment_lev;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	
	
}
