package egovframework.example.gallery.service;

import java.sql.Date;

public class GalleryVO {
	
	private int g_seq;
	private String g_title;
	private String g_content;
	private Date g_regdate;
	private int g_readcnt;
	private String g_tag;
	private String g_writer;
	private String g_thumbname;
	
	public int getG_seq() {
		return g_seq;
	}
	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}
	public String getG_title() {
		return g_title;
	}
	public void setG_title(String g_title) {
		this.g_title = g_title;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public Date getG_regdate() {
		return g_regdate;
	}
	public void setG_regdate(Date g_regdate) {
		this.g_regdate = g_regdate;
	}
	public int getG_readcnt() {
		return g_readcnt;
	}
	public void setG_readcnt(int g_readcnt) {
		this.g_readcnt = g_readcnt;
	}
	public String getG_tag() {
		return g_tag;
	}
	public void setG_tag(String g_tag) {
		this.g_tag = g_tag;
	}
	public String getG_writer() {
		return g_writer;
	}
	public void setG_writer(String g_writer) {
		this.g_writer = g_writer;
	}
	public String getG_thumbname() {
		return g_thumbname;
	}
	public void setG_thumbname(String g_thumbname) {
		this.g_thumbname = g_thumbname;
	}
}
