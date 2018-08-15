package hibernate.service;

import hibernate.dao.ManagerDAOImpl;
import hibernate.domain.Manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDAOImpl managerDAO;
	
	
	@Override
	@Transactional
	public List<Manager> getAllManagers() {
		return managerDAO.getAllManagers();
	}

}
