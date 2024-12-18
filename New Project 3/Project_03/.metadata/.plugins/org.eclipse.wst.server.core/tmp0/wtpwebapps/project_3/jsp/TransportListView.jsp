
<%@page import="in.co.rays.project_3.controller.TransportListCtl"%>
<%@page import="in.co.rays.project_3.dto.TransportDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.model.ModelFactory"%>

<%@page import="in.co.rays.project_3.util.DataUtility"%>

<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Trans List</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
<style>
.hm {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/new pro11.jpg');
	background-size: 100%;
	background-attachment: fixed;
}

.p1 {
	padding: 4px;
	width: 200px;
	font-size: bold;
}

.text {
	text-align: center;
}
</style>
<nav class="fixed-top"> <%@include file="Header.jsp"%></nav>
<br>
<br>
<br>
</head>
<body class="hm">

	<%@include file="calendar.jsp"%>


	<div>
		<form class="pb-5" action="<%=ORSView.TRANSPORT_LIST_CTL%>"
			method="post">
			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.TransportDTO"
				scope="request"></jsp:useBean>
			<%
				/* List list1 = (List) request.getAttribute("roleList");
				List ulist1 = (List) request.getAttribute("modellist"); */
				HashMap map1 = (HashMap) request.getAttribute("mode");
			%>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());

				List list = ServletUtility.getList(request);

				Iterator<TransportDTO> it = list.iterator();
				if (list.size() != 0) {
			%>
			<center>
				<h1 class="text-light font-weight-bold pt-3">Transport List</h1>
			</center>
			<div class="row">
				<div class="col-md-4"></div>
				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible"
					style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>

			<div class="row">


				<div class="col-sm-2">
					<input type="text" name="description" placeholder="Enter FirstName"
						class="form-control"
						value="<%=ServletUtility.getParameter("description", request)%>">
				</div>
				&emsp;
				<div class="col-sm-2">
					<input type="text" name="cost" placeholder="Enter Login Id"
						class="form-control"
						value="<%=ServletUtility.getParameter("cost", request)%>">
				</div>
				&emsp;
				<div class="col-sm-2"><%=HTMLUtility.getList("mode", String.valueOf(dto.getCost()), map1)%></div>

				&emsp;

				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 15px" name="operation"
						value="<%=TransportListCtl.OP_SEARCH%>">&emsp; <input
						type="submit" class="btn btn-dark btn-md" style="font-size: 15px"
						name="operation" value="<%=TransportListCtl.OP_RESET%>">
				</div>
				<div class="col-sm-2"></div>
			</div>

			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table table-bordered table-primary table-hover">
					<thead>
						<tr style="background-color: skyblue;">

							<th width="10%"><input type="checkbox" id="select_all"
								name="Select" class="text"> Select All</th>
							<th width="5%" class="text">S.NO</th>
							<th width="15%" class="text">Description</th>
							<th width="15%" class="text">Cost</th>
							<th width="20%" class="text">Mode</th>
							<th width="10%" class="text">Date</th>
							<th width="10%" class="text">Edit</th>

						</tr>
					</thead>


					<tbody>
						<tr>
						
						<td align="center"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"></td>

							<td class="text"><%=index++%></td>
							<td class="text"><%=dto.getDescription()%></td>
							<td class="text"><%=dto.getCost()%></td>
							<td class="text"><%=dto.getMode()%></td>
							<td class="text"><%=dto.getTdate()%></td>
							<td class="text"><a href="TransportCtl?id=<%=dto.getId()%>">Edit</a></td>

						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						value="<%=TransportListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
					<td><input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=TransportListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=TransportListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=TransportListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>

			<%
				if (list.size() == 0) {
			%>
			<center>
				<h1 style="font-size: 40px; color: white;">
					<b>User List</b>
				</h1>
			</center>
			</br>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>




				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible"
					style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div style="padding-left: 48%;">
					<input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=TransportListCtl.OP_BACK%>">
				</div>

				<div class="col-md-4"></div>
			</div>

			<%
				}
			%>

			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>


	</div>


</body>
<%@include file="FooterView.jsp"%>
</html>