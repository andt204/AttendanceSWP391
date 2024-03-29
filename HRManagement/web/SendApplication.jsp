<%-- 
    Document   : department
    Created on : Jan 14, 2024, 10:53:39 AM
    Author     : ThuyVy
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.AccountDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Send Application</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!--<link rel="stylesheet" type="text/css" href="assets/css/main.css">-->
    <style>


        .form-group {
            margin-bottom: 20px; /* Adjust margin as needed */
        }

        label {
            font-weight: bold; /* Make labels bold */
        }

        textarea {
            width: 100%; /* Make the textarea full width */
            box-sizing: border-box; /* Include padding and border in the width */
        }

        .file-attach {
            margin-top: 10px; /* Adjust margin as needed */
        }

        .submit-btn {
            background-color: #007bff; /* Set your desired button color */
            color: #fff; /* Set text color to white */
            padding: 10px 15px; /* Adjust padding as needed */
            border: none;
            border-radius: 5px; /* Add rounded corners */
            cursor: pointer;
            font-size: 16px;
        }

        .submit-btn:hover {
            background-color: #0056b3; /* Set a different color on hover */
        }
    </style>
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
                    <h4 class="page-title">Send Application</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <!-- Send Application -->
                    <div class="send-application" id="application-content">
                        <div class="application-container" id="request-content">

                            <form class="application-form" method="post" action="sendapplication">
                                <div class="form-group">
                                    <label for="application-type">Select Application Type:</label>
                                    <select id="application-type" name="applicationType">
                                        <c:forEach items="${requestScope.types_list}" var="tl">
                                            <option value="${tl.type_id}">${tl.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="manager">Select Manager:</label>
                                    <select id="manager" name="receiver_id">
                                        <c:forEach items="${requestScope.managers_list}" var="ml">
                                            <option value="${ml.employee_id}">${ml.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="title">Title:</label>
                                    <textarea id="title" name="title" rows="1" placeholder="Enter title" required=""></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="content">Content:</label>
                                    <textarea id="content" name="content" rows="4" placeholder="Enter content" required=""></textarea>
                                </div>
                                <input type="hidden" name="fileAttach" value="NULL">
                                <input type="submit" class="submit-btn" value="Submit">
                            </form>

                        </div>
                    </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/js1.js"></script>

</body>

</html>
