<%@ page import="models.AccountDTO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Update Employee</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/employeecss.css">
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
            <% } else if (role == 3|| role == 1) { %>
            <jsp:include page="SideBarforManager.jsp" />
            <% } %>

            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-5">
                            <h4 class="page-title">Update Employee</h4>
                        </div>
                        <div class="col-sm-7 col-7 text-right m-b-30">

                        </div>

                        <div class="main">
                            <a href="employee">
                                <button type="button" class="btn btn-secondary" style="margin: 10px 0 ;">Back</button>
                            </a>
                            <c:set var="id" value="${requestScope.id}" />
                            <form action="update-employee" method="post" >
                                <input type="hidden" name="id" value="${id}"/>
                                <div class="main-text-table">
                                    <table>
                                        <tr>
                                            <td >
                                                Employee Name
                                            </td>
                                            <td>

                                                <div class = "left-input-table" >
                                                    <div class="input-group input-group-sm mb-3" >
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="name" value="${employee.name}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorName}
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div  class = "right-text-table" >
                                                    Employee Salary
                                                </div>

                                            </td>
                                            <td>

                                                <div class ="right-input-table" style="margin-left: 40px">


                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="number" class="form-control" aria-label="Small" value="${employee.basicSalary}"
                                                               aria-describedby="inputGroup-sizing-sm" name="salary" id="salaryInput" placeholder="Employee Salary" required="" style="width: 312px;">
                                                    </div>
                                                    <div style="color: red" id="salaryValidationMessage">${messageErrorSalary}</div>


                                                </div>

                                            </td>
                                        </tr>

                                        <tr >
                                            <td>Phone Number</td>
                                            <td>
                                                <div class = "left-input-table"  >
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" value="${employee.phoneNumber}"  name="phoneNumber"  >
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorPhoneNumber}
                                                    </div>

                                                </div>
                                            <td>
                                                <div class = "right-text-table">
                                                    Address
                                                </div>
                                            </td>
                                            <td>
                                                <div class ="right-input-table" style="margin-left: 40px">


                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="text" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="address" value="${employee.address}" style="width: 312px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorAddress}
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr  >
                                            <td>Email</td>
                                            <td>
                                                <div class = "left-input-table">
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="email" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="email" value="${employee.email}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorEmail}
                                                    </div>
                                                </div>
                                            </td>
                                            <td> 
                                                <div class="right-text-table" >
                                                    Gender
                                                </div>
                                            </td>
                                            <td>
                                                <c:if test="${employee.gender eq 'false'}" >


                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "male" checked >

                                                        <label class="form-check-label" for="flexRadioDefault1">
                                                            Male
                                                        </label>

                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "female"style="margin-left: 20px"  >

                                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 40px">
                                                            Female
                                                        </label>
                                                    </div>
                                                </c:if>
                                                <c:if test="${employee.gender eq 'true'}" >
                                                    <div class = "right-input-table" style="margin-left: 60px" >
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "male" >

                                                        <label class="form-check-label" for="flexRadioDefault1">
                                                            Male
                                                        </label>

                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="flexRadioDefault1" value = "female" checked style="margin-left: 20px"  >

                                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-left: 40px">
                                                            Female
                                                        </label>
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Birth Date</td>
                                            <td>
                                                <div class = "left-input-table">
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <input type="date" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="birthDate" value="${employee.birthDate}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorBirthDate}
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorBirthday}
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="right-text-table">
                                                    Hire Date        
                                                </div>
                                            </td>
                                            <td>
                                                <div class = "right-input-table" style="margin-left: 40px" >
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm" ></span>
                                                        </div>
                                                        <input type="date" class="form-control" aria-label="Small"
                                                               aria-describedby="inputGroup-sizing-sm" name="hireDate" value="${employee.hireDate}" style="width: 300px;">
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorHireDate}
                                                    </div>
                                                    <div style="color: red">
                                                        ${requestScope.messageErrorDate}
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div  class = "left-text-table" >
                                                    Employee Image
                                                </div>

                                            </td>
                                            <td>
                                               
                                               
                                                <div class ="left-input-table" style= "width: 200px" >
                                                    <input type="file" 
                                                           accept="image/*" class="btn btn-outline-secondary"
                                                           name="image" placeholder="Employee Image" onchange="loadFile(event)" id="exampleFormControlFile1" required="" >
                                                </div>
                                                <div class ="left-input-table" style= "width: 200px" >

                                                    <img src="assets/img/avatar/${employee.image}" id="output" style="width: 35%;height: 100px;object-fit: cover"/>

                                                </div>


                                            </td>

                                            <td>
                                                <div  class = "right-text-table" >
                                                    Department
                                                </div>

                                            </td>
                                            <td>
                                                <div class = "right-input-table" style="margin-left: 40px" >
                                                    <div class="input-group input-group-sm mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="inputGroup-sizing-sm"></span>
                                                        </div>
                                                        <select name="department" class="form-control">
                                                            <c:if test="${department1 != null}">
                                                                <option value="${department1}">${department1}</option>
                                                            </c:if>
                                                            <c:forEach items="${department}" var="d">
                                                                <option value="${d.name}">${d.name}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </div>



                                                </div>



                                            </td>

                                        </tr>
                                        <tr>

                                            <td>
                                                <div class = "left-text-table"  >



                                                </div>

                                            </td>



                                        </tr>
                                    </table>
                                    <div class="add-to-system">
                                        <button type="submit" class="btn btn-success" style="margin-top: 30px" >Add to
                                            system</button>
                                    </div>
                                </div>
                            </form>
                        </div>
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
        <script >
                                                               document.getElementById('salaryInput').addEventListener('input', function () {
                                                                   var salary = parseFloat(this.value);
                                                                   var validationMessage = document.getElementById('salaryValidationMessage');
                                                                   if (salary < 0) {
                                                                       validationMessage.textContent = "Salary cannot be negative.";
                                                                   } else {
                                                                       validationMessage.textContent = ""; // Clear the message
                                                                   }
                                                               });
                                                               var loadFile = function (event) {
                                                                   var output = document.getElementById('output');
                                                                   output.src = URL.createObjectURL(event.target.files[0]);
                                                                   output.onload = function () {
                                                                       URL.revokeObjectURL(output.src);
                                                                   }
                                                               };
        </script>

    </body>

</html>

