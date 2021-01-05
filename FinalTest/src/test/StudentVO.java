package test;

public class StudentVO {
	private int no;
	private String name;
	private String id;
	private String pw;
	private int score;

	public StudentVO() {
	}

	public StudentVO(int no, String name, String id, String pw, int score) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.score = score;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void printData() {
		System.out.println("번호 : " + no + " 이름 : " + name + " 아이디 : " + id + " 비밀번호 : " + pw + " 성적 : " + score);
	}

	@Override
	public String toString() {
		return "Student [no=" + no + " name=" + name + " id=" + id + " pw=" + pw + " score=" + score + "]";
	}

}
