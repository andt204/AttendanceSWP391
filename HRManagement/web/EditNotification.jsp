<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="models.AccountDTO" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <title>Edit Notification</title>
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
            <% } else if (role == 3||role == 1) { %>
            <jsp:include page="SideBarforManager.jsp" />
            <% } %>
            <c:set var="o" value="${Noti}" />
            <div class="page-wrapper">
                <div class="content">
                    <div class="container mt-5">
                        <h2 class="mb-4">Send Notification</h2>   
                        <form action="editNotification?id=${o.notificationId}" method="post" enctype="multipart/form-data" onsubmit="return confirmSend();">
                            <div class="form-group">
                                <label for="subject">Subject:${o.notificationId}</label>
                                <input value="${o.subject}" type="text" class="form-control" id="subject" name="subject" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Description:</label>
                                <textarea  class="form-control" id="description" name="description" rows="20" style="resize: none;" required>${o.description}</textarea>
                            </div>
                            <div class="form-group">
                                <input type="radio" id="option1" name="option" value="1" onchange="toggleFileInput()"> Option 1
                                <input type="radio" id="option2" name="option" value="2" onchange="toggleFileInput()"> Option 2
                                <div class="form-group" id="fileInput">
                                    <label for="file">Choose File:</label>
                                    <input type="file" class="form-control-file" id="file" name="file" ">
                                </div>
                                <div id="fileInputMessage"></div>
                            </div>
                            <button type="submit" class="btn btn-primary">Send</button>
                        </form>
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
        <script>
                                    function confirmSend() {
                                        var option1 = document.getElementById("option1");
                                        var option2 = document.getElementById("option2");
                              
                                        if ((option1.checked && option2.checked) || (!option1.checked && !option2.checked)) {
                                            alert("You need to choose 1 or 2");
                                            return false; 
                                        }

                                        
                                        var confirmSend = confirm("Are you sure to edit this Notification?");
                                        if (confirmSend) {
                                            alert("Edit Notification Successfully!");
                                        }
                                        return confirmSend;
                                    }


        </script>

        <script>
            window.onload = function () {
                // ?n tr??ng input file khi trang ???c t?i
                var fileInput = document.getElementById("fileInput");
                fileInput.style.display = "none";
            };
            function toggleFileInput() {
                var option1 = document.getElementById("option1");
                var fileInput = document.getElementById("fileInput");

                if (option1.checked) {

                    fileInput.style.display = "none";
                    fileInput.value = ""; // Set giá tr? c?a tr??ng input file thành r?ng
                    document.getElementById("fileInputMessage").innerHTML = "IF choose 1 , you want to delete the file in data";
                } else {
                    fileInput.style.display = "block";
                    document.getElementById("fileInputMessage").innerHTML = "IF choose 2 , you want to change or stay the file in data";
                }
            }
        </script>

    </body>

</html>
