package com.gyu.realty.api.vo;

public class BoardContent {

	private int no;
	private String title;
	private String contents;
	private String write_time;
	private String writer;
	private int view_count;
	private int like_count;
	
	public int getNo() {
		return no;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getContents() {
		return contents;
	}
	
	public String getWriteTime() {
		return write_time;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public int getViewCount() {
		return view_count;
	}

	public int getLikeCount() {
		return like_count;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public void setWriteTime(String writeTime) {
		this.write_time = writeTime;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public void setViewCount(int viewCount) {
		this.view_count = viewCount;
	}
	
	public void setLikeCount(int likeCount) {
		this.like_count = likeCount;
	}
}
