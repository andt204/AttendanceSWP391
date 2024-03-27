<%-- 
    Document   : UpdateSalary
    Created on : Mar 11, 2024, 9:34:03 AM
    Author     : Dan
--%>

<%-- 
    Document   : AddSalary
    Created on : Mar 8, 2024, 2:21:03 AM
    Author     : Dan
--%>

<%@ page import="models.AccountDTO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Add Salary</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>

    <body>
        <%
                AccountDTO acc = (AccountDTO) session.getAttribute("account");
                int role=     acc.getRole();
        %>
        <c:set var="em" value="${requestScope.emp}" />
        <div class="main-wrapper">
            <% if (role == 2) { %>
            <jsp:include page="SideBarforEm.jsp" />
            <% } else if (role == 3||role == 1) { %>
            <jsp:include page="SideBarforManager.jsp" />
            <% } %>

            <div class="page-wrapper">
                <div class="content">
                    <div class="row" style="margin-left: 20px">
                        <div class="col-sm-5 col-5">
                            <h4 class="page-title">Update Salary</h4>
                        </div>
                    </div>
                    <div class="row" style="margin-left: 30px">
                        <a href="ListSalary">
                            <button type="button" class="btn btn-secondary" style="margin: 10px 0 ;">Back</button>
                        </a>
                    </div>
                    <c:set var="id" value="${requestScope.id}" />
                    <div class="row d-flex justify-content-center">
                        <form action="UpdateSalary" method="post">
                            <input type="hidden" name="id" value="${id}"/>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="" style="font-weight: bold">UserName  

                                    </label>
                                    <input type="text" class="form-control"  placeholder="UserName" readonly=""  value="${account.userName}"    name="username" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="" style="font-weight: bold">Department  

                                    </label>
                                    <input type="text" class="form-control"  placeholder="Department" readonly="" value="${department.name}"  name="department" >
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputPassword4" style="font-weight: bold">Full Name 

                                    </label>
                                    <input type="text" class="form-control"  placeholder="Full Name" readonly="" value="${employee.name}" name="employee" >
                                </div>
                            </div>

                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label for="inputFullname4" style="font-weight: bold">Basic Salary</label>
                                    <input type="number" class="form-control" id="basicSalary" placeholder="Basic Salary" value="${employee.basicSalary}" name="basicSalary" readonly="" oninput="calculateTax()">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputFullname4" style="font-weight: bold">Real Salary</label>
                                    <input type="number" class="form-control" id="realSalary" placeholder="Real Salary" readonly="" value="${employee.basicSalary*(26-leaveDay)/26 }" name="basicSalary" oninput="calculateTax()">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPhone4" style="font-weight: bold">Allowance</label>
                                    <input type="number" class="form-control" id="allowance" placeholder="Allowance" value="${salary.allowance}"  oninput="calculateTax()" name="allowance" required="">
                                    <div style="color: red" id="allowanceValidationMessage">${messageErrora}</div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="role" style="font-weight: bold">Bonus</label>
                                    <input type="number" class="form-control" id="bonus" placeholder="Bonus" name="bonus" value="${salary.bonus}" oninput="calculateTax()" required="">
                                    <div style="color: red" id="bonusValidationMessage">${messageErrorb}</div>
                                </div>


                            </div>
                            <div class="form-row">

                                <div class="form-group col-md-6">
                                    <label for="inputAddress" style="font-weight: bold">Tax</label>
                                    <input type="number" class="form-control" id="tax" readonly placeholder="Tax"  value="${salary.tax}" name="tax" oninput="calculateTax()">
                                </div>


                            </div>
                            <button type="submit" class="btn btn-primary addBtn">Add</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>



        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/app.js"></script>

        <script>
            function calculateTax() {
                var basicSalary = parseFloat(document.getElementById('basicSalary').value);
                var allowance = parseFloat(document.getElementById('allowance').value);
                var bonus = parseFloat(document.getElementById('bonus').value);

                var totalAmount = basicSalary + allowance + bonus;
                var tax = totalAmount * 0.1; // Calculate tax (10%)

                // Display the tax in the tax input field
                document.getElementById('tax').value = tax.toFixed(2); // Fixed to 2 decimal places
            }
        </script>

    </body>

</html>




