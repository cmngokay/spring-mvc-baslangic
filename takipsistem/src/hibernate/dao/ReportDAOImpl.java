package hibernate.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hibernate.domain.Report;

@Repository
public class ReportDAOImpl implements ReportDAO{

	@Autowired
	private SessionFactory sessionFactory;	
	
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@Override
	public void insertReport(Report report) {
		Session session = sessionFactory.getCurrentSession();
		session.save(report);
	}

}
