package hibernate.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Report {

	@Id
	@GeneratedValue(strategy=GenerationType.TABLE)
	private int reportId;
	private int studentNumber;
	private String managerName;
	private String reportDate;
	private String report;
	
	public Report() {
		super();
	}
	
	
	
	public Report(int studentNumber, String managerName,
			String reportDate, String report) {
		super();		
		this.studentNumber = studentNumber;
		this.managerName = managerName;
		this.reportDate = reportDate;
		this.report = report;
	}



	public int getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(int studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}


	public String getReportDate() {
		return reportDate;
	}


	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	
	
	
	
}
