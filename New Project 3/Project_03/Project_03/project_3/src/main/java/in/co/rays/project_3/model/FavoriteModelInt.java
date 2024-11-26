package in.co.rays.project_3.model;

import java.util.List;

import in.co.rays.project_3.dto.FavoriteDTO	;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;

public interface FavoriteModelInt {

	
	
	

	public long add(FavoriteDTO	 dto)throws ApplicationException,DuplicateRecordException;
	public void delete(FavoriteDTO	 dto)throws ApplicationException;
	public void update(FavoriteDTO	 dto)throws ApplicationException,DuplicateRecordException;
	public FavoriteDTO	 findByPK(long pk)throws ApplicationException;
	public FavoriteDTO	 findByLogin(String login)throws ApplicationException;
	public List list()throws ApplicationException;
	public List list(int pageNo,int pageSize)throws ApplicationException;
	public List search(FavoriteDTO	 dto,int pageNo,int pageSize)throws ApplicationException;
	public List search(FavoriteDTO	 dto)throws ApplicationException;

	public List getRoles(FavoriteDTO	 dto)throws ApplicationException;


}
