package hibernate.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Student {

	@Id
	private int studentNumber;
	private String studentName;
	private String studentSurname;
	private String internshipStartDate;
	private String internshipDeadline;
	private String managerName;

	@ManyToOne
	private Manager manager;
	
	public Student() {
		
	}
		

	public Student(int studentNumber, String studentName,
			String studentSurname, String internshipStartDate,
			String internshipDeadline, String managerName) {
		super();
		this.studentNumber = studentNumber;
		this.studentName = studentName;
		this.studentSurname = studentSurname;
		this.internshipStartDate = internshipStartDate;
		this.internshipDeadline = internshipDeadline;
		this.managerName = managerName;
	}


	public int getStudentNumber() {
		return studentNumber;
	}


	public void setStudentNumber(int studentNumber) {
		this.studentNumber = studentNumber;
	}


	public String getStudentName() {
		return studentName;
	}


	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}


	public String getStudentSurname() {
		return studentSurname;
	}


	public void setStudentSurname(String studentSurname) {
		this.studentSurname = studentSurname;
	}


	public String getInternshipStartDate() {
		return internshipStartDate;
	}


	public void setInternshipStartDate(String internshipStartDate) {
		this.internshipStartDate = internshipStartDate;
	}


	public String getInternshipDeadline() {
		return internshipDeadline;
	}


	public void setInternshipDeadline(String internshipDeadline) {
		this.internshipDeadline = internshipDeadline;
	}


	public Manager getManager() {
		return manager;
	}


	public void setManager(Manager manager) {
		this.manager = manager;
	}


	public String getManagerName() {
		return managerName;
	}


	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}


	
	
}
