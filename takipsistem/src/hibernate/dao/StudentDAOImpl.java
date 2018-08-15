package hibernate.dao;

import hibernate.domain.Student;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class StudentDAOImpl implements StudentDAO{

	@Autowired
	private SessionFactory sessionFactory;	
	
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insertStudent(Student student) {
		Session session = sessionFactory.getCurrentSession();
		session.save(student);
	}

	@Override
	public Student getStudentById(int studentNumber) {
		Session session = sessionFactory.getCurrentSession();
		Student student = (Student) session.get(Student.class, studentNumber);
		return student;
	}

	@Override
	public List<Student> getAllStudents() {
		Session session = sessionFactory.getCurrentSession();
		TypedQuery<Student> query = (TypedQuery) session.createQuery("from Student",Student.class);
		return query.getResultList();
	}

	@Override
	public void updateStudent(Student student) {
		Session session = sessionFactory.getCurrentSession();
		session.update(student);
	}

	@Override
	public void deleteStudent(int studentNumber) {
		Session session = getCurrentSession();
		//Student s = (Student) session.get(Student.class,new Integer(studentNumber));
		Student s = getStudentById(studentNumber);
		if (s != null) {
			session.delete(s);
		}
	}
	
	@Override
	public String getManagernameById(int studentNumber) {
		Session session = sessionFactory.getCurrentSession();
		Student student = (Student) session.get(Student.class, studentNumber);
		return student.getManagerName();
	}	
 
}
