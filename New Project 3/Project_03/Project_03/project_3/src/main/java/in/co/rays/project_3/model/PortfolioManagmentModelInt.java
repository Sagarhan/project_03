package in.co.rays.project_3.model;

import java.util.List;

import in.co.rays.project_3.dto.PortfolioManagmentDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;

public interface PortfolioManagmentModelInt {

	
	

	public long add(PortfolioManagmentDTO dto)throws ApplicationException,DuplicateRecordException;
	public void delete(PortfolioManagmentDTO dto)throws ApplicationException;
	public void update(PortfolioManagmentDTO dto)throws ApplicationException,DuplicateRecordException;
	public PortfolioManagmentDTO findByPK(long pk)throws ApplicationException;
	public PortfolioManagmentDTO findByLogin(String login)throws ApplicationException;
	public List list()throws ApplicationException;
	public List list(int pageNo,int pageSize)throws ApplicationException;
	public List search(PortfolioManagmentDTO dto,int pageNo,int pageSize)throws ApplicationException;
	public List search(PortfolioManagmentDTO dto)throws ApplicationException;

	public List getRoles(PortfolioManagmentDTO dto)throws ApplicationException;


}
