package hibernate.service;

import hibernate.domain.Student;

import java.util.List;

public interface StudentService {

	public void insertStudent(Student student);

	public Student getStudentById(int studentNumber);
	
	public String getManagernameById(int studentNumber);

	public List<Student> getAllStudents();

	public void updateStudent(Student student);

	public void deleteStudent(int studentNumber);
}
