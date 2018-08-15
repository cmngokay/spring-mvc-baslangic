package hibernate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hibernate.dao.ReportDAOImpl;
import hibernate.domain.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDAOImpl reportDAO;
	
	@Override
	@Transactional
	public void insertReport(Report report) {
		reportDAO.insertReport(report);
	}

}
