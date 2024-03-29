<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.AccountDTO" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Admin Dashboard</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
        <%@ page import="java.util.Map" %>
        <%@ page import="java.util.HashMap" %>

        <%
            // Assuming departmentEmployeeCount is available as a request attribute
            Map<String, Integer> departmentEmployeeCount = (Map<String, Integer>) request.getAttribute("departmentEmployeeCount");
        %>
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
                </div>
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-6 col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="chart-title">
                                    <h4>Employee By Department</h4>
                                </div>	
                                <canvas id="myDoughnutChart" width="400" height="400"></canvas>
                                <script>
                                    // Khai b�o bi?n departmentData b�n ngo�i v�ng l?p
                                    var departmentData = {
                                        labels: [],
                                        datasets: [{
                                                data: [],
                                                backgroundColor: [
                                                    'rgb(255, 99, 132)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(255, 205, 86)',
                                                    'rgb(75, 192, 192)',
                                                    'rgb(153, 102, 255)',
                                                    'rgb(255, 159, 64)',
                                                    'rgb(255, 77, 77)',
                                                    'rgb(92, 184, 92)',
                                                    'rgb(240, 173, 78)',
                                                    'rgb(112, 146, 190)',
                                                    'rgb(217, 83, 79)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(183, 55, 156)',
                                                    'rgb(64, 191, 128)',
                                                    'rgb(255, 184, 82)',
                                                    'rgb(70, 130, 180)',
                                                    'rgb(0, 128, 0)',
                                                    'rgb(255, 20, 147)'
                                                ]
                                            }]
                                    };

                                    <c:forEach var="entry" items="${listDepartmentEmployee}">
                                    var departmentName = "${entry.departmentName}";
                                    var employeeCount = ${entry.employeeCount};
                                    departmentData.labels.push(departmentName);
                                    departmentData.datasets[0].data.push(employeeCount);
                                    </c:forEach>
                                    // L?y th? canvas ?? v? bi?u ??
                                    var ctx = document.getElementById('myDoughnutChart').getContext('2d');

                                    // T?o bi?u ?? doughnut
                                    var myDoughnutChart = new Chart(ctx, {
                                        type: 'doughnut',
                                        data: departmentData,
                                        options: {
                                            // T�y ch?n kh�c c� th? ???c th�m v�o ? ?�y
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-6 col-xl-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="chart-title">
                                    <h4>Attendance By Department</h4>
                                    <div class="float-right">
                                        <ul class="chat-user-total">      
                                        </ul>
                                    </div>
                                </div>	
                                <canvas id="myBarChart" width="400" height="400"></canvas>

                                <script>
                                    var attendanceData = {
                                        labels: [],
                                        datasets: [{
                                                label: ["%"],
                                                data: [],
                                                backgroundColor: [
                                                    'rgb(255, 99, 132)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(255, 205, 86)',
                                                    'rgb(75, 192, 192)',
                                                    'rgb(153, 102, 255)',
                                                    'rgb(255, 159, 64)',
                                                    'rgb(255, 77, 77)',
                                                    'rgb(92, 184, 92)',
                                                    'rgb(240, 173, 78)',
                                                    'rgb(112, 146, 190)',
                                                    'rgb(217, 83, 79)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(183, 55, 156)',
                                                    'rgb(64, 191, 128)',
                                                    'rgb(255, 184, 82)',
                                                    'rgb(70, 130, 180)',
                                                    'rgb(0, 128, 0)',
                                                    'rgb(255, 20, 147)'
                                                ],
                                                borderColor: [
                                                    'rgb(255, 99, 132)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(255, 205, 86)',
                                                    'rgb(75, 192, 192)',
                                                    'rgb(153, 102, 255)',
                                                    'rgb(255, 159, 64)',
                                                    'rgb(255, 77, 77)',
                                                    'rgb(92, 184, 92)',
                                                    'rgb(240, 173, 78)',
                                                    'rgb(112, 146, 190)',
                                                    'rgb(217, 83, 79)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(183, 55, 156)',
                                                    'rgb(64, 191, 128)',
                                                    'rgb(255, 184, 82)',
                                                    'rgb(70, 130, 180)',
                                                    'rgb(0, 128, 0)',
                                                    'rgb(255, 20, 147)'
                                                ],
                                                borderWidth: 1
                                            }]
                                    };
                                    <c:forEach var="entry" items="${departmentAttendanceList}">
                                    var departmentName = "${entry.departmentName}";
                                    var attendancePercentage = ${entry.attendancePercentage};
                                    attendanceData.labels.push(departmentName);
                                    attendanceData.datasets[0].data.push(attendancePercentage);
                                    </c:forEach>
                                    var ctxBar = document.getElementById('myBarChart').getContext('2d');

                                    var myBarChart = new Chart(ctxBar, {
                                        type: 'bar',
                                        data: attendanceData,
                                        options: {
                                            scales: {
                                                yAxes: [{
                                                        ticks: {
                                                            beginAtZero: true
                                                        }
                                                    }]
                                            },
                                            legend: {
                                                display: false // ?n nh�n c?a bi?u ??
                                            }
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
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
