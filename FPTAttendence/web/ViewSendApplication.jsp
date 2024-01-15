<%-- 
    Document   : ViewSendApplication
    Created on : Jan 15, 2024, 10:27:23 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="assets/css/main.css" rel="stylesheet">
        <title>Your Website</title>
    </head>

    <body>
        <header>
            <div class="container-fluid">
                <div class="row">
                    <!-- <div class="col-auto"> -->
                    <img src="y-nghia-logo-fpt-lan-3.jpg" alt="Company Logo">
                    <!-- </div> -->
                    <!-- <div class="col text-end"> -->
                    <div class="user-info">
                        <p>thuy vy</p>
                        <img src="avatar.jpg" alt="Avatar">
                        <a href="#">Logout</a>
                    </div>
                    <!-- </div> -->
                </div>
            </div>
        </header>

        <div class="container-fluid mt-3">
            <div class="row">
                <aside class="col-lg-2 col-md-3">
                    <ul class="nav flex-column">
                        <li class="nav-item"><a id="attendance" class="nav-link" href="#">Điểm danh</a></li>
                        <li class="nav-item"><a id="profile" class="nav-link" href="#">Thông tin cá nhân</a></li>
                        <li class="nav-item"><a id="application"class="nav-link" href="sendapplication">Viết đơn</a></li>
                        <li class="nav-item"><a id="showapplication"class="nav-link" href="viewsendapplication">Xem các đơn đã gửi</a></li>
                        <li class="nav-item"><a id="Nofitication"class="nav-link" href="#">Thông báo</a></li>
                    </ul>
                </aside>

                <main class="col-lg-10 col-md-9" >
                    <section class="main-content"  >                                   


                        <section class="showapplication" id="showapplication-content">
                            <h1>Xem đơn</h1>
                            <div class="application-container">
                                <table class="process-table">
                                    <thead>
                                        <tr>
                                            <th>TYPE</th>
                                            <th>PURPOSE</th>
                                            <th>CREATEDATE</th>
                                            <th>FILE</th>
                                            <th>STATUS</th>
                                            <th>DONE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.list_application}" var="la">
                                        <tr>
                                            <td>${la.type_name}</td>
                                            <td>${la.reason}</td>
                                            <td>${la.create_date}</td>
                                            <td>${la.file}</td>
                                            <td>${la.type_name}</td>
                                            <td>
                                                <span>${la.complete_date}</span>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        <!-- Thêm các hàng khác tương ứng -->
                                    </tbody>
                                </table>
                            </div>
                        </section>

                    </section>
                </main>
            </div>
        </div>

        <footer class="bg-light text-center p-3">
            <p>&copy; 2024 Your Company</p>
        </footer>

        <!-- Bootstrap JS và Popper.js (cần thiết cho một số tính năng của Bootstrap) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/js1.js"></script>
    </body>
</html>

