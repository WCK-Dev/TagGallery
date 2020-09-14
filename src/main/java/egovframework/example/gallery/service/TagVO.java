package egovframework.example.gallery.service;

import java.sql.Date;

public class TagVO {

	private int t_seq;
	private String t_name;
	private int t_usecnt;
	private Date t_regdate;
	private int g_seq;
	
	public int getT_seq() {
		return t_seq;
	}
	public void setT_seq(int t_seq) {
		this.t_seq = t_seq;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public int getT_usecnt() {
		return t_usecnt;
	}
	public void setT_usecnt(int t_usecnt) {
		this.t_usecnt = t_usecnt;
	}
	public Date getT_regdate() {
		return t_regdate;
	}
	public void setT_regdate(Date t_regdate) {
		this.t_regdate = t_regdate;
	}
	public int getG_seq() {
		return g_seq;
	}
	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}
}
