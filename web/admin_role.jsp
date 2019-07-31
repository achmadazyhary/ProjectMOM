<%-- 
    Document   : admin_role
    Created on : Jul 29, 2019, 9:47:18 AM
    Author     : Bella
--%>

<%@page import="models.Role"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>
<!-- Page Content -->
<div class="main">
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Role</h1>
                    <!--Table-->
                    <%
                        List<Role> listRole = (List<Role>) session.getAttribute("listRole");
                        Role role = (Role) session.getAttribute("role");
                        if (session.getAttribute("listRole") == null) {
                            response.sendRedirect("RoleServlet");
                        }
                    %>
                    <div align="right">
                        <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#modalInsert">Insert Data</button>
                    </div>
                    <br>
                    <br>
                    <div align="center" >
                        <table  class="table table-striped table-bordered" style="width: 90%" id="roleTable">
                            <thead>
                                <tr>
                                    <th>No</th> 
                                    <!--<th>ID</th>-->
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (session.getAttribute("listRole") != null) {
                                        for (Role rol : listRole) {
                                %>
                                <tr>
                                    <td></td>
                                    <td><%=rol.getName()%></td>
                                    <td><a class="btn btn-danger"  href="RoleServlet?action=delete&id=<%=rol.getId()%>">Delete</a>
                                        <a class="btn btn-primary" data-toggle="modal" data-target="#modalEdit<%=rol.getId()%>" >Update</a>
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
                <form action="insertRoleServlet" method="POST">
                    <label><b>Name</b></label>
                    <input class="form-control" type="text" name="name" value="<%=(role != null) ? role.getName() : ""%>" />
                    <br>
                    <input  type="submit" value="Save" class="btn btn-success" id="insert">
                </form>
            </div>
        </div>
    </div>
</div>
<!--End of Modal Insert-->

<!-- Modal Edit-->
<%if (session.getAttribute("listRole") != null) {
    for (Role r : listRole) {%>
<div class="modal fade" id="modalEdit<%= r.getId()%>" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="RoleServlet" method="POST">
                    <label><b>ID</b></label>
                    <input class="form-control" type="text" name="id" value="<%=r.getId()%>" readonly/>
                    <br>
                    <label><b>Name</b></label>
                    <input class="form-control" type="text" name="name" value="<%=r.getName()%>" />
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
    session.removeAttribute("listRole");
    session.removeAttribute("role");
%>
</html>
