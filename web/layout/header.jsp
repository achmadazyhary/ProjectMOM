<%-- 
    Document   : header
    Created on : Jul 29, 2019, 2:49:54 PM
    Author     : HARRY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <!--End of CSS Data tables-->

        <!--CSS and JS SweetAlert-->
        <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
        <script src="sweetalert2.all.min.js"></script>
        <!--End of CSS and JS SweetAlert-->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/style.css"/>
    </head>
    <body>
        <div class="sidenav">
            <button class="dropdown-btn">Master Data
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="admin_employee.jsp">Employee</a>
                <a href="admin_customer.jsp">Customer</a>
                <a href="admin_role.jsp">Role</a>
                <a href="admin_status.jsp">Status</a>    
            </div>
            <a href="admin_meeting.jsp">Register Meeting</a>
        </div>

        <script>
            /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;

            for (i = 0; i < dropdown.length; i++) {
                dropdown[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var dropdownContent = this.nextElementSibling;
                    if (dropdownContent.style.display === "block") {
                        dropdownContent.style.display = "none";
                    } else {
                        dropdownContent.style.display = "block";
                    }
                });
            }
        </script>
