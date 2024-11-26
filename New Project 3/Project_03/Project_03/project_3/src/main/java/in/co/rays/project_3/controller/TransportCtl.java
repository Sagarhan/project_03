package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.TransportDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.TransportModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

/**
 * user functionality controller.to perform add,delete and update operation
 * 
 * @author Mahi singh
 *
 */
@WebServlet(urlPatterns = { "/ctl/TransportCtl" })
public class TransportCtl extends BaseCtl {

	
	private static final long serialVersionUID = 1L;
	 
	
	  private static Logger log = Logger.getLogger(TransportCtl.class);
	 
	protected void preload(HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("AirWays", "AirWays");
		map.put("By Road","By Road");
		map.put("Railways", "Railways");
		map.put("By Water", "By Water");
		request.setAttribute("map1", map);
		}

	protected boolean validate(HttpServletRequest request) {
		boolean pass = true;
		if (DataValidator.isNull(request.getParameter("description"))) {
			request.setAttribute("description", PropertyReader.getValue("error.require", "description"));
			System.out.println(pass);
			pass = false;
		}
		
		if (DataValidator.isNull(request.getParameter("mode"))) {
			request.setAttribute("mode", PropertyReader.getValue("error.require", "mode"));
			System.out.println(pass);
			pass = false;
		} 
			if (DataValidator.isNull(request.getParameter("date"))) {
				request.setAttribute("date", PropertyReader.getValue("error.require", "date"));
				pass = false;
		} 
		
			if (DataValidator.isNull(request.getParameter("cost"))) {
				request.setAttribute("cost", PropertyReader.getValue("error.require", "cost"));
				System.out.println(pass);
				pass = false;
			}	
		
		return pass;
	}

	protected BaseDTO populateDTO(HttpServletRequest request) {
		TransportDTO dto = new TransportDTO();

		dto.setId(DataUtility.getLong(request.getParameter("id")));
		dto.setDescription(DataUtility.getString(request.getParameter("description")));
		dto.setMode(DataUtility.getString(request.getParameter("mode")));
		dto.setTdate(DataUtility.getDate(request.getParameter("date")));
		dto.setCost(DataUtility.getInt(request.getParameter("cost")));
		
		populateBean(dto, request);

	return dto;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		/*
		 * log.debug("TransportCtl Method doGet Started");
		 */		String op = DataUtility.getString(request.getParameter("operation"));
		// get model
		TransportModelInt model = ModelFactory.getInstance().getTransportModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (id > 0 || op != null) {
			System.out.println("in id > 0  condition");
			TransportDTO dto;
			try {
				dto = model.findByPK(id)
;
				ServletUtility.setDto(dto, request);
			} catch (Exception e) {
				e.printStackTrace();
				/*
				 * log.error(e);
				 */				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forward(getView(), request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String op = DataUtility.getString(request.getParameter("operation"));
		TransportModelInt model = ModelFactory.getInstance().getTransportModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		System.out.println("dopost.....ID " + id);
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			TransportDTO dto = (TransportDTO) populateDTO(request);
			try {
				if (id > 0) {
					model.update(dto);

					ServletUtility.setSuccessMessage("Data is successfully Update", request);
				} else {

					try {
						
						model.add(dto);
						System.out.println("data added");
						ServletUtility.setDto(dto, request);
						ServletUtility.setSuccessMessage("Data is successfully saved", request);
					} catch (ApplicationException e) {
						/*
						 * log.error(e);
						 */						ServletUtility.handleException(e, request, response);
						return;
					} catch (DuplicateRecordException e) {
						ServletUtility.setDto(dto, request);
						ServletUtility.setErrorMessage("Title already exists", request);
					}

				}
				ServletUtility.setDto(dto, request);

			} catch (ApplicationException e) {
				/*
				 * log.error(e);
				 */				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setDto(dto, request);
				ServletUtility.setErrorMessage("Title already exists", request);
			}
		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			TransportDTO dto = (TransportDTO) populateDTO(request);
			try {
				model.delete(dto);
				ServletUtility.redirect(ORSView.TRANSPORT_LIST_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				/*
				 * log.error(e);
				 */				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TRANSPORT_CTL, request, response);
			return;
		} else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TRANSPORT_CTL, request, response);
			return;
		}
		ServletUtility.forward(getView(), request, response);

		/*
		 * log.debug("JobCtl Method doPostEnded");
		 */	}

	@Override
	protected String getView() {
		return ORSView.TRANSPORT_VIEW;
	}

}