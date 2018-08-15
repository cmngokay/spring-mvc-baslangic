package hibernate.service;

import hibernate.dao.StudentDAOImpl;
import hibernate.domain.Student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDAOImpl studentDAO;
	
	@Override
	@Transactional
	public void insertStudent(Student student) {
		studentDAO.insertStudent(student);		
	}
 
	@Override
	@Transactional
	public Student getStudentById(int studentNumber) {
		return studentDAO.getStudentById(studentNumber);
	}

	@Override
	@Transactional
	public List<Student> getAllStudents() {
		return studentDAO.getAllStudents();
	}

	@Override
	@Transactional
	public void updateStudent(Student student) {
		studentDAO.updateStudent(student);		
	}

	@Override
	@Transactional
	public void deleteStudent(int studentNumber) {
		studentDAO.deleteStudent(studentNumber);
	}

	@Override
	@Transactional
	public String getManagernameById(int studentNumber) {
		return studentDAO.getManagernameById(studentNumber);
	}
}
