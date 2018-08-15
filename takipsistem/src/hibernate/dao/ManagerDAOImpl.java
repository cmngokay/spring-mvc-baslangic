package hibernate.dao;

import hibernate.domain.Manager;
import hibernate.domain.Student;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Autowired
	private SessionFactory sessionFactory;	
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<Manager> getAllManagers() {		
		Session session = sessionFactory.getCurrentSession();
		List<Manager> managerList = session.createQuery("from Manager").list();
		
		return managerList;
	}

}
