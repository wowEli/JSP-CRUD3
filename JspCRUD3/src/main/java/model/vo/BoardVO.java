package model.vo;

public class BoardVO {
	private int bid;
	private String title;
	private String content;
	private String writer;
	private String writeDay;
	// 이 두 변수는 MySQL 테이블과는 별개로 자바단에서만 사용한다 (검색 시 한 번만 사용하고 필요없기 때문)
	private String searchCondition; // 제목검색 , 작성자 검색중 택 1
	private String searchContent; // 검색 내용을 저장할 변수 
	public String getWriteDay() {
		return writeDay;
	}
	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}
}
