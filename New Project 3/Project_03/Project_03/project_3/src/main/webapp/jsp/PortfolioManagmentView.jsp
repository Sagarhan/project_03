

<%@page import="in.co.rays.project_3.controller.PortfolioManagmentCtl"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.List"%>

<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=ORSView.APP_CONTEXT%>/js/validateInput.js"></script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PortfolioManagmentList view</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=ORSView.APP_CONTEXT%>/js/utility.js"></script>

<script type="text/javascript">
	function validateMobileNo(event) {
		const input = event.target;
		input.value = input.value.replace(/[^0-9.]/g, '')
		if (input.value.length > 0 && input.value[0] <= '5') {
			input.value = '';
		}
	}
</script>

<script type="text/javascript">
	function numberLength(input) {
		if (input.value.length > 10) {
			input.value = input.value.slice(0, 10);
		}
	}
</script>
<script>
	// Include the JavaScript function here or link to an external file
	function validateAlphaNum(inputElement, errorElementId, maxLength) {
		const errorMessage = document.getElementById(errorElementId);
		let currentValue = inputElement.value;

		// Clear existing error messages
		errorMessage.textContent = '';

		// Remove non-alphanumeric characters
		currentValue = currentValue.replace(/[^a-zA-Z0-9]/g, '');

		// Ensure the input starts with a letter if required
		if (currentValue.length > 0 && !/^[a-zA-Z]/.test(currentValue)) {
			errorMessage.textContent = 'Input must start with a letter.';
			currentValue = currentValue.replace(/^[^a-zA-Z]+/, ''); // Remove leading non-letters
		}

		// Ensure the length does not exceed maxLength
		if (currentValue.length > maxLength) {
			errorMessage.textContent = `Input exceeds the maximum length of ${maxLength} characters.`;
			currentValue = currentValue.slice(0, maxLength);
		}

		// Update the input field value
		inputElement.value = currentValue;
	}
</script>

<style type="text/css">
i.css {
	border: 2px solid #8080803b;
	padding-left: 10px;
	padding-bottom: 11px;
	background-color: #ebebe0;
}

.input-group-addon {
	box-shadow: 9px 8px 7px #001a33;
	background-image: linear-gradient(to bottom right, purple, white);
	background-repeat: no repeat;
	background-size: 100%;
	padding-bottom: 11px;
}

.hm {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/download (3).jpeg');
	background-size: cover;
	padding-top: 6%;
}
</style>

</head>
<body class="hm">
	<div class="header">
		<%@include file="Header.jsp"%>
		<%@include file="calendar.jsp"%>
	</div>
	<div>

		<main>
		<form action="<%=ORSView.PORTFOLIOMANAGMENT_CTL%>" method="post">
			<jsp:useBean id="dto"
				class="in.co.rays.project_3.dto.PortfolioManagmentDTO"
				scope="request"></jsp:useBean>
			<div class="row pt-3">
				<!-- Grid column -->
				<div class="col-md-4 mb-4"></div>
				<div class="col-md-4 mb-4">
					<div class="card input-group-addon">
						<div class="card-body">

							<%
								long id = DataUtility.getLong(request.getParameter("id"));

								if (dto.getId() != null && id > 0) {
							%>
							<h3 class="text-center default-text text-primary">Update
								PortfolioManagmentList</h3>
							<%
								} else {
							%>
							<h3 class="text-center default-text text-primary">Add
								PortfolioManagmentList</h3>
							<%
								}
							%>
							<!--Body-->
							<div>


								<%
									HashMap map = (HashMap) request.getAttribute("map");
								%>





								<H4 align="center">
									<%
										if (!ServletUtility.getSuccessMessage(request).equals("")) {
									%>
									<div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getSuccessMessage(request)%>
									</div>
									<%
										}
									%>
								</H4>

								<H4 align="center">
									<%
										if (!ServletUtility.getErrorMessage(request).equals("")) {
									%>
									<div class="alert alert-danger alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getErrorMessage(request)%>
									</div>
									<%
										}
									%>

								</H4>

								<input type="hidden" name="id" value="<%=dto.getId()%>">

							</div>

							<div class="md-form">

								<span class="pl-sm-5"><b> PortfolioName</b> <span
									style="color: red;">*</span></span> </br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-user-alt grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>

										<input type="text" name="portfolioName"
											placeholder="Enter PortfolioName" class="form-control"
											oninput="validateAlphaNum(this, 'portfolioNameError', 25)"
											onblur="validateAlphaNum(this, 'portfolioNameError', 25)"
											value="<%=DataUtility.getStringData(dto.getPortfolioName())%>">


									</div>
								</div>

								<font color="red" class="pl-sm-5" id="portfolioNameError">
									<%=ServletUtility.getErrorMessage("portfolioName", request)%></font></br> <span
									
									class="pl-sm-5"><b>RiskToleranceLevel</b> <span
									style="color: red;">*</span></span></br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-user-circle grey-text"
													style="font-size: 1rem;"></i>
											</div>
										</div>


										<%=HTMLUtility.getList("RiskToleranceLevel", String.valueOf(dto.getRiskToleranceLevel()), map)%>
									</div>
								</div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("RiskToleranceLevel", request)%></font></br>


								<span class="pl-sm-5"><b>InitialInvestmentAmount</b> <span
									style="color: red;">*</span></span></br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-list grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>
										<input type="text" class="form-control"
											name="initialInvestmentAmount" placeholder=" Enter quantity"
											oninput="handleIntegerInput(this, 'initialInvestmentAmountError', 10)"
											onblur="validateIntegerInput(this, 'initialInvestmentAmountError', 10)"
											value="<%=DataUtility.getStringData(dto.getInitialInvestmentAmount()).equals("0") ? ""
					: DataUtility.getStringData(dto.getInitialInvestmentAmount())%>">
									</div>
								</div>
								<font color="red" class="pl-sm-5"
									id="initialInvestmentAmountError"> <%=ServletUtility.getErrorMessage("initialInvestmentAmount", request)%></font></br>



								<span class="pl-sm-5"><b> InvestmentStrategy</b> <span
									style="color: red;">*</span></span> </br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-list grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>
										<input type="text" name="investmentStrategy"
											placeholder="Enter InvestmentStrategy" class="form-control"
											oninput="handleLetterInput(this, 'investmentStrategyError', 100)"
											onblur="validateLetterInput(this, 'investmentStrategyError', 100)"
											rows="5" cols="5"
											value="<%=DataUtility.getStringData(dto.getInvestmentStrategy())%>">

									</div>
								</div>

								<font color="red" class="pl-sm-5" id="investmentStrategyError">
									<%=ServletUtility.getErrorMessage("investmentStrategy", request)%></font></br>






								<%-- 
								<%
								if (dto.getId()==null||id<=0) {
								%> --%>





								<%
									if (dto.getId() != null && id > 0) {
								%>

								<div class="text-center">

									<input type="submit" name="operation"
										class="btn btn-success btn-md" style="font-size: 17px"
										value="<%=PortfolioManagmentCtl.OP_UPDATE%>"> <input
										type="submit" name="operation" class="btn btn-warning btn-md"
										style="font-size: 17px"
										value="<%=PortfolioManagmentCtl.OP_CANCEL%>">

								</div>
								<%
									} else {
								%>
								<div class="text-center">

									<input type="submit" name="operation"
										class="btn btn-success btn-md" style="font-size: 17px"
										value="<%=PortfolioManagmentCtl.OP_SAVE%>"> <input
										type="submit" name="operation" class="btn btn-warning btn-md"
										style="font-size: 17px"
										value="<%=PortfolioManagmentCtl.OP_RESET%>">
								</div>

							</div>
							<%
								}
							%>
						</div>
					</div>
		</form>
		</main>
		<div class="col-md-4 mb-4"></div>

	</div>

</body>
<%@include file="FooterView.jsp"%>

</body>
</html>
