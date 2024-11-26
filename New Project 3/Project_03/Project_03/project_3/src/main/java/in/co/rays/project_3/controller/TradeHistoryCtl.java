package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.TradeHistoryDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.TradeHistoryModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name = "TradeHistoryCtl", urlPatterns = { "/ctl/TradeHistoryCtl" })
public class TradeHistoryCtl extends BaseCtl {

	protected void preload(HttpServletRequest request) {
		HashMap map = new HashMap();
		map.put("Buy", "Buy");
		map.put("Sale", "Sale");
		map.put("All", "All");

		request.setAttribute("map", map);

	}

	protected boolean validate(HttpServletRequest request) {
		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("userid"))) {
			request.setAttribute("userid", PropertyReader.getValue("error.require", "userid"));
			pass = false;

		}

		if (DataValidator.isNull(request.getParameter("startdate"))) {
			request.setAttribute("startdate", PropertyReader.getValue("error.require", "startdate"));
			pass = false;

		}

		if (DataValidator.isNull(request.getParameter("enddate"))) {
			request.setAttribute("enddate", PropertyReader.getValue("error.require", "enddate"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("transactiontype"))) {
			request.setAttribute("transactiontype", PropertyReader.getValue("error.require", "transactiontype"));
			pass = false;

		}

		return pass;
	}

	protected BaseDTO populateDTO(HttpServletRequest request) {
		TradeHistoryDTO dto = new TradeHistoryDTO();

		System.out.println(request.getParameter("date"));

		dto.setId(DataUtility.getLong(request.getParameter("id")));
		dto.setUserid(DataUtility.getString(request.getParameter("userid")));
		dto.setStartdate(DataUtility.getDate(request.getParameter("startdate")));
		dto.setEnddate(DataUtility.getDate(request.getParameter("enddate")));
		dto.setTransactiontype(DataUtility.getString(request.getParameter("transactiontype")));

		populateBean(dto, request);

		return dto;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String op = DataUtility.getString(request.getParameter("operation"));
		TradeHistoryModelInt model = ModelFactory.getInstance().getTradeHistoryModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (id > 0 || op != null) {
			TradeHistoryDTO dto;
			try {
				dto = model.findByPK(id);
				ServletUtility.setDto(dto, request);
			} catch (Exception e) {
				e.printStackTrace();
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forward(getView(), request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String op = DataUtility.getString(request.getParameter("operation"));
		TradeHistoryModelInt model = ModelFactory.getInstance().getTradeHistoryModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			TradeHistoryDTO dto = (TradeHistoryDTO) populateDTO(request);
			try {
				if (id > 0) {
					model.update(dto);

					ServletUtility.setSuccessMessage("Data is successfully Update", request);
				} else {

					try {
						model.add(dto);

						ServletUtility.setDto(dto, request);
						ServletUtility.setSuccessMessage("Data is successfully saved", request);
					} catch (ApplicationException e) {
						ServletUtility.handleException(e, request, response);
						return;
					} catch (DuplicateRecordException e) {
						ServletUtility.setDto(dto, request);
						ServletUtility.setErrorMessage("Login id already exists", request);
					}

				}
				ServletUtility.setDto(dto, request);

			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setDto(dto, request);
				ServletUtility.setErrorMessage("Login id already exists", request);
			}
		} else if (OP_DELETE.equalsIgnoreCase(op)) {

			TradeHistoryDTO dto = (TradeHistoryDTO) populateDTO(request);
			try {
				model.delete(dto);
				ServletUtility.redirect(ORSView.TRADEHISTORY_LIST_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TRADEHISTORY_LIST_CTL, request, response);
			return;
		} else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.TRADEHISTORY_CTL, request, response);
			return;
		}
		ServletUtility.forward(getView(), request, response);

	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.TRADEHISTORY_VIEW;
	}

}
