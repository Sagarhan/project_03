package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.PortfolioManagmentDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.PortfolioManagmentModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.DataValidator;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name = "PortfolioManagmentCtl", urlPatterns = { "/ctl/PortfolioManagmentCtl" })
public class PortfolioManagmentCtl extends BaseCtl {

	protected void preload(HttpServletRequest request) {
		HashMap map = new HashMap();
		map.put("Low", "Low");
		map.put("Medium", "Medium");
		map.put("High", "High");

		request.setAttribute("map", map);

	}

	protected boolean validate(HttpServletRequest request) {
		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("portfolioName"))) {
			request.setAttribute("portfolioName", PropertyReader.getValue("error.require", "portfolioName"));
			pass = false;

		}

		if (DataValidator.isNull(request.getParameter("initialInvestmentAmount"))) {
			request.setAttribute("initialInvestmentAmount",
					PropertyReader.getValue("error.require", "initialInvestmentAmount"));
			pass = false;

		}

		if (DataValidator.isNull(request.getParameter("riskToleranceLevel"))) {
			request.setAttribute("riskToleranceLevel", PropertyReader.getValue("error.require", "riskToleranceLevel"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("investmentStrategy"))) {
			request.setAttribute("investmentStrategy", PropertyReader.getValue("error.require", "investmentStrategy"));
			pass = false;

		}

		return pass;
	}

	protected BaseDTO populateDTO(HttpServletRequest request) {
		PortfolioManagmentDTO dto = new PortfolioManagmentDTO();

		System.out.println(request.getParameter("date"));

		dto.setId(DataUtility.getLong(request.getParameter("id")));
		dto.setPortfolioName(DataUtility.getString(request.getParameter("portfolioName")));
		dto.setRiskToleranceLevel(DataUtility.getString(request.getParameter("riskToleranceLevel")));
		dto.setInitialInvestmentAmount(DataUtility.getInt(request.getParameter("initialInvestmentAmount")));

		dto.setInvestmentStrategy(DataUtility.getString(request.getParameter("investmentStrategy")));

		populateBean(dto, request);

		return dto;

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("in do get");
		String op = DataUtility.getString(request.getParameter("operation"));
		System.out.println(op);
		PortfolioManagmentModelInt model = ModelFactory.getInstance().getPortfolioManagmentModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		System.out.println("id"+id);
		if (id > 0 || op != null) {
			PortfolioManagmentDTO dto;
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
		System.out.println("in do post");
		String op = DataUtility.getString(request.getParameter("operation"));
		PortfolioManagmentModelInt model = ModelFactory.getInstance().getPortfolioManagmentModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			PortfolioManagmentDTO dto = (PortfolioManagmentDTO) populateDTO(request);
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

			PortfolioManagmentDTO dto = (PortfolioManagmentDTO) populateDTO(request);
			try {
				model.delete(dto);
				ServletUtility.redirect(ORSView.PORTFOLIOMANAGMENT_LIST_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return;
			}

		} else if (OP_CANCEL.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.PORTFOLIOMANAGMENT_LIST_CTL, request, response);
			return;
		} else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.PORTFOLIOMANAGMENT_CTL, request, response);
			return;
		}
		ServletUtility.forward(getView(), request, response);

	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.PORTFOLIOMANAGMENT_VIEW;
	}

}
