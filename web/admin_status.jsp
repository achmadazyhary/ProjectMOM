<%-- 
    Document   : admin_status
    Created on : Jul 29, 2019, 10:00:03 AM
    Author     : Bella
--%>

<%@page import="java.util.List"%>
<%@page import="models.Status"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>
    <!-- Page Content -->
    <div class="main">

        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Status</h1>
                        <!--Table-->
                        <%
                            List<Status> listStatus = (List<Status>) session.getAttribute("listStatus");
                            Status status = (Status) session.getAttribute("status");
                            if (session.getAttribute("listStatus") == null) {
                                response.sendRedirect("StatusServlet");
                            }
                        %>
                        <div align="right">
                            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#modalInsert">Insert Data</button>
                        </div>
                        <br>
                        <br>
                        <div align="center" >
                            <table  class="table table-striped table-bordered" style="width: 90%" id="statusTable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (session.getAttribute("listStatus") != null) {
                                            for (Status sta : listStatus) {
                                    %>
                                    <tr>
                                        <td></td>
                                        <td><%=sta.getName()%></td>
                                        <td><a class="btn btn-danger"  href="StatusServlet?action=delete&id=<%=sta.getId()%>">Delete</a>
                                            <a class="btn btn-primary" href=# data-toggle="modal" data-target="#modalEdit<%=sta.getId()%>" >Update</a>
                                        </td>
                                    </tr>
                                    <%}
                                        }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Insert-->
    <div class="modal fade" id="modalInsert" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="insertStatusServlet" method="POST">
                        <label><b>Name</b></label>
                        <input class="form-control" type="text" name="name" value="<%=(status != null) ? status.getName() : ""%>" />
                        <br>
                        <input  type="submit" value="Save" class="btn btn-success" id="insert">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--End of Modal Insert-->
    
    <!-- Modal Edit-->
    <%if (session.getAttribute("listStatus") != null) {
            for (Status s : listStatus) {%>              
                <div class="modal fade" id="modalEdit<%=s.getId()%>" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form action="StatusServlet" method="POST">
                                    <label><b>ID</b></label>
                                    <input class="form-control" type="text" name="id" value="<%=s.getId()%>" readonly/>
                                    <br>
                                    <label><b>Name</b></label>
                                    <input class="form-control" type="text" name="name" value="<%=s.getName()%>" />
                                    <br>
                                    <input  type="submit" value="Save" class="btn btn-success" id="insert">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            <%}
        }
    %>
    <!--End of Modal Edit-->
<%@include file="layout/footer.jsp"%>
<%
    session.removeAttribute("listStatus");
    session.removeAttribute("status");
%>
</html>
