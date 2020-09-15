package egovframework.example.gallery.service;

public class FilesVO {

	private int f_seq;
	private String f_originname;
	private String f_uploadname;
	private String f_thumbname;
	private long f_fsize;
	private int f_downcnt;
	private int g_seq;
	
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getF_originname() {
		return f_originname;
	}
	public void setF_originname(String f_originname) {
		this.f_originname = f_originname;
	}
	public String getF_uploadname() {
		return f_uploadname;
	}
	public void setF_uploadname(String f_uploadname) {
		this.f_uploadname = f_uploadname;
	}
	public String getF_thumbname() {
		return f_thumbname;
	}
	public void setF_thumbname(String f_thumbname) {
		this.f_thumbname = f_thumbname;
	}
	public long getF_fsize() {
		return f_fsize;
	}
	public void setF_fsize(long f_fsize) {
		this.f_fsize = f_fsize;
	}
	public int getF_downcnt() {
		return f_downcnt;
	}
	public void setF_downcnt(int f_downcnt) {
		this.f_downcnt = f_downcnt;
	}
	public int getG_seq() {
		return g_seq;
	}
	public void setG_seq(int g_seq) {
		this.g_seq = g_seq;
	}
}
