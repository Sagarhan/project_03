package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.TransportDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.TransportModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

/**
 * User List functionality controller.to perform Search and List operation.
 * 
 * @author Sagar Hans
 *
 */
@WebServlet(name = "TransportListCtl", urlPatterns = { "/ctl/TransportListCtl" })
public class TransportListCtl extends BaseCtl {

	
	private static Logger log = Logger.getLogger(TransportListCtl.class);

	protected void preload(HttpServletRequest request) {
		
		HashMap map = new HashMap();
		map.put("byRoad", "byroad");
		map.put("byAirways", "byAirways");
		map.put("byWater", "byWater");
		
		request.setAttribute("mode", map);
	}
	
	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
		TransportDTO dto = new TransportDTO();

		dto.setId(DataUtility.getLong(request.getParameter("id")));
		dto.setDescription(DataUtility.getString(request.getParameter("description")));
		dto.setCost(DataUtility.getInt(request.getParameter("cost")));
		dto.setMode(DataUtility.getString(request.getParameter("mode")));
		dto.setTdate(DataUtility.getDate(request.getParameter("tdate")));
		
		
		populateBean(dto, request);
		return dto;
	}

	/**
	 * Contains Display logics
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("TransportListCtl doGet Start");
		List list;
		List next;
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		System.out.println("==========" + pageSize);
		TransportDTO dto = (TransportDTO) populateDTO(request);
// get the selected checkbox ids array for delete list
		TransportModelInt tmodel = ModelFactory.getInstance().getTransportModel();
		try {
			System.out.println("in ctllllllllll search");
			list = tmodel.search(dto, pageNo, pageSize);

			ArrayList<TransportDTO> a = (ArrayList<TransportDTO>) list;

			for (TransportDTO udto1 : a) {
			}

			System.out.println(list + "----------------------------------------------------------");
			System.out.println(list.indexOf(3));
			next = tmodel.search(dto, pageNo + 1, pageSize);
			ServletUtility.setList(list, request);
			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			if (next == null || next.size() == 0) {
				request.setAttribute("nextListSize", 0);

			} else {
				request.setAttribute("nextListSize", next.size());
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		} catch (Exception e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.debug("TransportListCtl doPOst End");
	}

	/**
	 * Contains Submit logics
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("TransportListCtl doPost Start");
		List list = null;
		List next = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;
		TransportDTO dto = (TransportDTO) populateDTO(request);
		String op = DataUtility.getString(request.getParameter("operation"));
		System.out.println("op---->" + op);

// get the selected checkbox ids array for delete list
		String[] ids = request.getParameterValues("ids");
		TransportModelInt tmodel = ModelFactory.getInstance().getTransportModel();
		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.TRANSPORT_CTL, request, response);
				return;
			} else if (OP_RESET.equalsIgnoreCase(op)) {

				ServletUtility.redirect(ORSView.TRANSPORT_LIST_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				pageNo = 1;
				if (ids != null && ids.length > 0) {
					TransportDTO deletedto = new TransportDTO();
					for (String id : ids) {
						deletedto.setId(DataUtility.getLong(id));
						tmodel.delete(deletedto);
						ServletUtility.setSuccessMessage("Data Deleted Successfully", request);
					}
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			}
			if (OP_BACK.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.TRANSPORT_LIST_CTL, request, response);
				return;
			}
			dto = (TransportDTO) populateDTO(request);
			

			list = tmodel.search(dto, pageNo, pageSize);

			ServletUtility.setDto(dto, request);
			next = tmodel.search(dto, pageNo + 1, pageSize);

			ServletUtility.setList(list, request);
			ServletUtility.setList(list, request);
			if (list == null || list.size() == 0) {
				if (!OP_DELETE.equalsIgnoreCase(op)) {
					ServletUtility.setErrorMessage("No record found ", request);
				}
			}
			if (next == null || next.size() == 0) {
				request.setAttribute("nextListSize", 0);

			} else {
				request.setAttribute("nextListSize", next.size());
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		} catch (Exception e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.debug("TransportListCtl doGet End");
	}

	@Override
	protected String getView() {
		return ORSView.TRANSPORT_LIST_VIEW;
	}

}