
<%@page import="in.co.rays.project_3.controller.OrderCtl"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order view</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<%=ORSView.APP_CONTEXT%>/js/utility.js"></script>
<script>
	function validateNumberKey(event, validationMessageId) {
		// Allow only digits, minus sign, and dot for latitude and longitude input
		if (!/[0-9\-]/.test(event.key)) {
			// Show validation message
			var validationMsg = document.getElementById(validationMessageId);
			validationMsg.style.display = 'inline';
			event.preventDefault(); // Prevent typing the invalid character
		} else {
			// Hide validation message if input is valid
			var validationMsg = document.getElementById(validationMessageId);
			validationMsg.style.display = 'none';
		}
	}
</script>


<style type="text/css">
i.css {
	bInventory: 2px solid #8080803b;
	padding-left: 10px;
	padding-bottom: 11px;
	background-color: #ebebe0;
}

.input-group-addon {
	box-shadow: 9px 8px 7px #001a33;
	background-image: linear-gradient(to bottom right, white, pink);
	background-repeat: no repeat;
	background-size: 100%;
	padding-bottom: 11px;
}

.hm {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/course_img.jpg');
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
		<form action="<%=ORSView.ORDER_CTL%>" method="post">
			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.OrderDTO"
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
								Order</h3>
							<%
								} else {
							%>
							<h3 class="text-center default-text text-primary">Add Order</h3>
							<%
								}
							%>

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
								<span class="pl-sm-5"><b> CustomerName</b> <span
									style="color: red;">*</span></span>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-user grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>
										<input type="text" class="form-control" name=customername
											placeholder=" Enter customername"
											oninput="handleLetterInput(this, 'customernameError', 20)"
											onblur="validateLetterInput(this, 'customernamerror', 20)"
											value="<%=DataUtility.getStringData(dto.getCustomername())%>">

									</div>

									<font color="red" class="pl-sm-5" id="customernameError">
										<%=ServletUtility.getErrorMessage("customername", request)%></font></br>
								</div>


								<div class="md-form">
									<span class="pl-sm-5"><b> Address</b> <span
										style="color: red;">*</span></span>
									<div class="col-sm-12">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-user grey-text" style="font-size: 1rem;"></i>
												</div>
											</div>
											<input type="text" class="form-control" name=address
												placeholder=" Enter address"
												oninput="handleLetterInput(this, 'addressError', 20)"
												onblur="validateLetterInput(this, 'addressrror', 20)"
												value="<%=DataUtility.getStringData(dto.getAddress())%>">

										</div>

										<font color="red" class="pl-sm-5" id="addressError"> <%=ServletUtility.getErrorMessage("address", request)%></font></br>
									</div>




									<span class="pl-sm-5"><b>Product</b> <span
										style="color: red;">*</span></span>
									<div class="col-sm-12">
										<div class="input-group">
											<div class="input-group-prepend">
												<div class="input-group-text">
													<i class="fa fa-user grey-text" style="font-size: 1rem;"></i>
												</div>
											</div>

											<%
												String htmlList = HTMLUtility.getList("product", String.valueOf(dto.getProduct()), map);
											%>

											<%=htmlList%>
										</div>
									</div>
									<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("product", request)%></font></br>


									<div class="md-form">
										<span class="pl-sm-5"><b>Amount</b> <span
											style="color: red;">*</span></span></br>
										<div class="col-sm-12">
											<div class="input-group">
												<div class="input-group-prepend">
													<div class="input-group-text">
														<i class="fa fa-list grey-text" style="font-size: 1rem;"></i>
													</div>
												</div>
												<input type="text" class="form-control" name="amount"
													placeholder=" Enter amount"
													oninput="handleIntegerInput(this, 'amountError', 10)"
													onblur="validateIntegerInput(this, 'amountError', 10)"
													value="<%=DataUtility.getStringData(dto.getAmount()).equals("0") ? ""
					: DataUtility.getStringData(dto.getAmount())%>">
											</div>
										</div>
										<font color="red" class="pl-sm-5" id="amountError"> <%=ServletUtility.getErrorMessage("amount", request)%></font></br>





										<div class="md-form">
											<span class="pl-sm-5"><b>Phone</b> <span
												style="color: red;">*</span></span> </br>
											<div class="col-sm-12">
												<div class="input-group">
													<div class="input-group-prepend">
														<div class="input-group-text">
															<i class="fa fa-venus-mars grey-text"
																style="font-size: 1rem;"></i>
														</div>
													</div>
													<input type="text" class="form-control" name="phone"
														placeholder="Enter phone"
														oninput="handleIntegerInput(this, 'phoneError', 10)"
														onblur="validateIntegerInput(this, 'phoneError', 10)"
														value="<%=DataUtility.getStringData(dto.getPhone()).equals("0") ? ""
					: DataUtility.getStringData(dto.getPhone())%>">

												</div>
											</div>
											<font color="red" class="pl-sm-5" id="phoneError"> <%=ServletUtility.getErrorMessage("phone", request)%></font></br>




											<%
												if (dto.getId() != null && id > 0) {
											%>

											<div class="text-center">

												<input type="submit" name="operation"
													class="btn btn-success btn-md" style="font-size: 17px"
													value="<%=OrderCtl.OP_UPDATE%>"> <input
													type="submit" name="operation"
													class="btn btn-warning btn-md" style="font-size: 17px"
													value="<%=OrderCtl.OP_CANCEL%>">

											</div>
											<%
												} else {
											%>
											<div class="text-center">

												<input type="submit" name="operation"
													class="btn btn-success btn-md" style="font-size: 17px"
													value="<%=OrderCtl.OP_SAVE%>"> <input type="submit"
													name="operation" class="btn btn-warning btn-md"
													style="font-size: 17px" value="<%=OrderCtl.OP_RESET%>">
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

