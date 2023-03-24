package com.spring.crud;

import java.time.LocalDate;

public class BoardVO {

	private Integer bno;
	private String title;
	private String content;
	private String writer;
	private LocalDate regdate;
	private LocalDate updatedate;
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public LocalDate getRegdate() {
		return regdate;
	}
	public void setRegdate(LocalDate regdate) {
		this.regdate = regdate;
	}
	public LocalDate getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(LocalDate updatedate) {
		this.updatedate = updatedate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	   public String toString() {
	      return "BoardVO [bno=" + bno + ", content=" + content + ", title=" + title
	            + ", writer=" + writer + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	   }
}