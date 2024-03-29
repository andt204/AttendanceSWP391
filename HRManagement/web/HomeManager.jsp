<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@ page import="models.AccountDTO" %>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Manager Dashboard</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
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
            <% } else if (role == 3||role==1) { %>
            <jsp:include page="SideBarforManager.jsp" />
            <% } %>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg1"><i class="fa fa-home" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>${numberDepartments}</h3>
                                    <span class="widget-title1">Departments <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg2"><i class="fa fa-user-o"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>${numberEmployees}</h3>
                                    <span class="widget-title2">Employees <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg3"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>${numberAttend}</h3>
                                    <span class="widget-title3">Attend <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                            <div class="dash-widget">
                                <span class="dash-widget-bg4"><i class="fa fa-calendar-times-o" aria-hidden="true"></i></span>
                                <div class="dash-widget-info text-right">
                                    <h3>${numberLeave}</h3>
                                    <span class="widget-title4">Leaves <i class="fa fa-check" aria-hidden="true"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">                    
                        <c:forEach items="${listDepartment}" var="o">
                            <div class="col-lg-6">
                                <div class="card-box">
                                    <div class="card-block">
                                        <h5 class="text-bold card-title" value="${o.department_id}">${o.name}</h5>
                                        <div class="table-responsive">
                                            <table class="table table-striped mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Phone</th>
                                                        <th>Gender</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${departmentEmployees[o.department_id]}" var="employee">
                                                        <tr>
                                                            <td>${employee.name}</td>
                                                            <td>${employee.email}</td>
                                                            <td>${employee.phoneNumber}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${employee.gender}">
                                                                        Male
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Female
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-12 col-md-4"></div>
                        <div class="col-12 col-md-6 col-lg-4 col-xl-4">
                            <div class="card member-panel">
                                <div class="card-header bg-white">
                                    <h4 class="card-title mb-0">Leaves List</h4>
                                </div>
                                <div class="card-body">
                                    <ul class="contact-list">
                                        <c:forEach items="${listLeave}" var="a">
                                            <li>
                                                <div class="contact-cont">

                                                    <div class="float-left user-img m-r-10">
                                                        <a href="#" title=${a.name}><img src=${a.image} alt="" class="w-40 rounded-circle"></a>
                                                    </div>
                                                    <div class="contact-info">
                                                        <span class="contact-name text-ellipsis">${a.name}</span>
                                                        <span class="contact-date">${a.email}</span>
                                                    </div>
                                                </div>
                                            </li> 
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="card-footer text-center bg-white">
                                    <a href="AttendanceReport" class="text-muted">View attendance report</a>
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
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/Chart.bundle.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/app.js"></script>
    </body>

</html>
