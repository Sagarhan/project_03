package in.co.rays.project_3.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.project_3.dto.TradeHistoryDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.util.HibDataSource;

public class TradeHistoryModeklHibImp implements TradeHistoryModelInt{
	
	
	
	@Override
	public long add(TradeHistoryDTO dto) throws ApplicationException, DuplicateRecordException {
		
		 TradeHistoryDTO existDto = null;
			
			Session session = HibDataSource.getSession();
			Transaction tx = null;
			try {

				tx = session.beginTransaction();

				session.save(dto);

				dto.getId();
				tx.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
				if (tx != null) {
					tx.rollback();

				}
				throw new ApplicationException("Exception in Owner Add " + e.getMessage());
			} finally {
				session.close();
			}


		return dto.getId();
	}

	@Override
	public void delete(TradeHistoryDTO dto) throws ApplicationException {

		
		Session session = null;
		Transaction tx = null;
		try {
			session = HibDataSource.getSession();
			tx = session.beginTransaction();
			session.delete(dto);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw new ApplicationException("Exception in Owner Delete" + e.getMessage());
		} finally {
			session.close();
		}

	}

	@Override
	public void update(TradeHistoryDTO dto) throws ApplicationException, DuplicateRecordException {
		
		
		Session session = null;
		
		/*
		 * Transaction tx = null; TradeHistoryDTO exesistDto = findByLogin(dto.getLogin());
		 * 
		 * if (exesistDto != null && exesistDto.getId() != dto.getId()) { throw new
		 * DuplicateRecordException("Login id already exist"); }
		 * 
		 */		  Transaction tx = null;
		 

		try {
			session = HibDataSource.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(dto);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw new ApplicationException("Exception in Owner update" + e.getMessage());
		} finally {
			session.close();
		}

	}

	@Override
	public TradeHistoryDTO findByPK(long pk) throws ApplicationException {
		
		
		Session session = null;
		TradeHistoryDTO dto = null;
		try {
			session = HibDataSource.getSession();
			dto = (TradeHistoryDTO) session.get(TradeHistoryDTO.class, pk);

		} catch (HibernateException e) {
			throw new ApplicationException("Exception : Exception in getting Bank by pk");
		} finally {
			session.close();
		}

		return dto;
	}

	@Override
	public TradeHistoryDTO findByLogin(String login) throws ApplicationException {
		
		
		
		Session session = null;
		TradeHistoryDTO dto = null;
		try {
			session = HibDataSource.getSession();
			Criteria criteria = session.createCriteria(TradeHistoryDTO.class);
			criteria.add(Restrictions.eq("login", login));
			List list = criteria.list();
			if (list.size() == 1) {
				dto = (TradeHistoryDTO) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new ApplicationException("Exception in getting Owner by Login " + e.getMessage());

		} finally {
			session.close();
		}

		return dto;
	}

	@Override
	public List list(int pageNo, int pageSize) throws ApplicationException {
		
		Session session = null;
		List list = null;
		try {
			session = HibDataSource.getSession();
			Criteria criteria = session.createCriteria(TradeHistoryDTO.class);
			if (pageSize > 0) {
				pageNo = (pageNo - 1) * pageSize;
				criteria.setFirstResult(pageNo);
				criteria.setMaxResults(pageSize);

			}
			list = criteria.list();

		} catch (HibernateException e) {
			throw new ApplicationException("Exception : Exception in  Banks list");
		} finally {
			session.close();
		}

		return list;
	}

	/*
	 * @Override public List list(int pageNo, int pageSize) throws
	 * ApplicationException { // TODO Auto-generated method stub return null; }
	 */
	@Override
	public List search(TradeHistoryDTO dto, int pageNo, int pageSize) throws ApplicationException {
		
		Session session = null;
		ArrayList<TradeHistoryDTO> list = null;
		try {
			session = HibDataSource.getSession();
			System.out.println("---------------------------------");
			Criteria criteria = session.createCriteria(TradeHistoryDTO.class);
			if (dto != null) {
				
				if (dto.getId() != null && dto.getId() > 0) {
					criteria.add(Restrictions.eq("id", dto.getId()));
				}
				if (dto.getUserid() != null && dto.getUserid().length() > 0) {
					criteria.add(Restrictions.like("userid", dto.getUserid() + "%"));
				}
				
				if (dto.getStartdate() != null && dto.getStartdate().getTime() > 0) {
					criteria.add(Restrictions.eq("startdate", dto.getStartdate()));
				}
				if (dto.getEnddate() != null && dto.getEnddate().getTime() > 0) {
					criteria.add(Restrictions.eq("enddate", dto.getEnddate()));
				}
				if (dto.getTransactiontype()!= null && dto.getTransactiontype().length() > 0) {
					  criteria.add(Restrictions.like("transactiontype", dto.getTransactiontype() + "%"));
					  }
				 
				 
			}
					if (pageSize > 0) {
						pageNo = (pageNo - 1) * pageSize;
						criteria.setFirstResult(pageNo);
						criteria.setMaxResults(pageSize);
					}
					list = (ArrayList<TradeHistoryDTO>) criteria.list();
				} catch (HibernateException e) {
					throw new ApplicationException("Exception in Owner search");
				} finally {
					session.close();
				}

		
		return list;
	}

	@Override
	public List search(TradeHistoryDTO dto) throws ApplicationException {
		// TODO Auto-generated method stub
		return search(dto,0,0);
	}

	@Override
	public List getRoles(TradeHistoryDTO dto) throws ApplicationException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List list() throws ApplicationException {
		// TODO Auto-generated method stub
		return list(0,0);
	}




}
