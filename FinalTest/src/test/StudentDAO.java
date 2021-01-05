package test;

import java.util.ArrayList;

public class StudentDAO {

	private static StudentDAO instance = new StudentDAO();

	public ArrayList<StudentVO> list = new ArrayList<StudentVO>(); // 학생리스트 
	public ArrayList<StudentVO> sortList = new ArrayList<StudentVO>(); // 학생 정렬리스트
	
	public int stuCnt = 0; // 현재 학생수
	public int stuNums = 0; // 현재까지 한번이라도 가입한 학생수 (탈퇴 포함)
	public double average = 0; // 학생들의 점수 평균
	public int sum = 0; // 학생들의 평균 총합

	public StudentDAO() { // 초기값 설정
		StudentVO temp = new StudentVO(1, "qwer", "qwer", "1111", 100);
		list.add(temp);
		sortList.add(temp);
		stuCnt++;
		stuNums++;
		temp = new StudentVO(2, "abcd", "abcd", "2222", 87);
		list.add(temp);
		sortList.add(temp);
		stuCnt++;
		stuNums++;
		temp = new StudentVO(3, "javaking", "javaking", "3333", 42);
		list.add(temp);
		sortList.add(temp);
		stuCnt++;
		stuNums++;
	}

	public static StudentDAO getInstance() {
		return instance;
	}

	public void addStudent(StudentVO st) { // 학생추가 (회원가입)
		list.add(st);
		sortList.add(st);
		stuCnt++;
		stuNums++;
	}

	public StudentVO removeStudent(int index) { // 학생삭제
		StudentVO delSt = list.get(index);
		list.remove(index);
		sortList.remove(index);
		stuCnt--;
		return delSt;
	}

	public int checkId(StudentVO st) { // 아이디 중복체크
		int check = -1;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId().equals(st.getId())) {
				check = i;
				break;
			}
		}
		return check;
	}

	public void printStudent() { // 학생출력
		for (int i = 0; i < list.size(); i++) {
			list.get(i).printData();
		}
	}
	
	public void printSortStudent() { // 정렬학생 오름차순 출력
		for (int i = 0; i < list.size(); i++) {
			sortList.get(i).printData();
		}
	}
	
	public void printSortReverseStudent() { // 정렬학생 내림차순 출력
		for (int i = list.size() - 1; i >= 0 ; i--) {
			sortList.get(i).printData();
		}
	}

	public void sortData() { // 학생 성적순으로 정렬
		for(int i=0; i<sortList.size(); i++) {
			int maxScore = sortList.get(i).getScore();
			int maxIdx = i;
			for(int j=i; j<sortList.size(); j++) {
				if(maxScore < sortList.get(j).getScore()) {
					maxScore = sortList.get(j).getScore();
					maxIdx = j;
				}
			}
			
			StudentVO temp = sortList.get(i);
			sortList.set(i, sortList.get(maxIdx));
			sortList.set(maxIdx, temp);
		}
	}

	public int getSize() { // arraylist 길이 출력
		return list.size();
	}
	
	public void getAvg() { // 학생 점수 평균
		sum = 0;
		for(int i = 0; i < list.size(); i++) {
			sum = sum + list.get(i).getScore();
		}
		
		average = (double) sum / stuCnt;
	}

}
