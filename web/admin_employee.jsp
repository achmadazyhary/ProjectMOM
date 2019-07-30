<%-- 
    Document   : sidebar
    Created on : Jul 26, 2019, 1:58:21 PM
    Author     : Bella
--%>

<%@page import="models.Role"%>
<%@page import="java.util.List"%>
<%@page import="models.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<!-- Page Content -->
    <div class="main">

        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Employee</h1>
                        <!--Table-->
                        <%
                            List<Employee> listEmployee = (List<Employee>) session.getAttribute("listEmployee");
                            List<Role> role = (List<Role>) session.getAttribute("listRole");
                            Employee employee = (Employee) session.getAttribute("employee");
                            if (session.getAttribute("listEmployee") == null) {
                                response.sendRedirect("EmployeeServlet");
                            }
                        %>
                        <div align="right">
                            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#modalInsert">Insert Data</button>
                        </div>
                        <br>
                        <br>
                        <div align="center" >
                            <table  class="table table-striped table-bordered" style="width: 90%" id="employeeTable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th>Phone</th>
                                        <th>Email</th>
                                        <th>Password</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (session.getAttribute("listEmployee") != null) {
                                            for (Employee emp : listEmployee) {
                                    %>
                                    <tr>
                                        <td></td>
                                        <td><%=emp.getId()%></td>
                                        <td><%=emp.getName()%></td>
                                        <td><%=emp.getRole().getName()%></td>
                                        <td><%=emp.getPhone()%></td>
                                        <td><%=emp.getEmail()%></td>
                                        <td><%=emp.getPassword()%></td>
                                        <td><a class="btn btn-danger"  href="EmployeeServlet?action=delete&id=<%=emp.getId()%>">Delete</a>
                                            <a class="btn btn-primary" href="" data-toggle="modal" data-target="#modalEdit<%=emp.getId()%>">Update</a>
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
                    <form action="EmployeeServlet" method="POST">
                        <label><b>ID</b></label>
                        <input class="form-control" type="text" name="id" value="<%=(employee != null) ? employee.getId() : ""%>"/>
                        <br>
                        <label><b>Name</b></label>
                        <input class="form-control" type="text" name="name" value="<%=(employee != null) ? employee.getName() : ""%>" />
                        <br>
                        <label><b>Role</b></label>
                        <div>
                            <select class="form-control" id="role" name="role">
                                <option value="">None</option>
                                <%  if(session.getAttribute("listRole") !=  null){
                                        for (Role r : role) {%>
                                        <option value="<%=r.getId()%>"<%=(employee!=null)?(Integer.parseInt(r.getId().toString())==
                                                Integer.parseInt(employee.getRole().getId().toString()))?
                                                "selected":"":""%>><%=r.getName()%></option>
                                        <%}
                                    }
                                %>
                            </select>
                        </div>
                        <br>
                        <label><b>Phone</b></label>
                        <input class="form-control" type="text" name="phone" value="<%=(employee != null) ? employee.getPhone() : ""%>" />
                        <br>
                        <label><b>Email</b></label>
                        <input class="form-control" type="text" name="email" value="<%=(employee != null) ? employee.getEmail() : ""%>" />
                        <br>
                        <label><b>Password</b></label>
                        <input class="form-control" type="password" name="password" value="<%=(employee != null) ? employee.getPassword() : ""%>" />
                        <br>
                        <input  type="submit" value="Save" class="btn btn-success" id="insert">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--End of Modal Insert-->
    
    <%if(session.getAttribute("listEmployee") != null){
        for (Employee emp1 : listEmployee) {%>
                
    <!-- Modal Edit-->
    <div class="modal fade" id="modalEdit<%=emp1.getId()%>" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="EmployeeServlet" method="POST">
                        <label><b>ID</b></label>
                        <input class="form-control" type="text" name="id" value="<%=emp1.getId()%>" readonly/>
                        <br>
                        <label><b>Name</b></label>
                        <input class="form-control" type="text" name="name" value="<%=emp1.getName()%>" />
                        <br>
                        <label><b>Role</b></label>
                        <div>
                            <select class="form-control" id="role" name="role">
                                <option value="">None</option>
                                <%  if(session.getAttribute("listRole") !=  null){
                                        for (Role r : role) {%>
                                        <option value="<%=r.getId()%>"<%=(emp1!=null)?(Integer.parseInt(r.getId().toString())==
                                                Integer.parseInt(emp1.getRole().getId().toString()))?
                                                "selected":"":""%>><%=r.getName()%></option>
                                        <%}
                                    }
                                %>
                            </select>
                        </div>
                        <br>
                        <label><b>Phone</b></label>
                        <input class="form-control" type="text" name="phone" value="<%=emp1.getPhone()%>" />
                        <br>
                        <label><b>Email</b></label>
                        <input class="form-control" type="text" name="email" value="<%=emp1.getEmail()%>" />
                        <br>
                        <label><b>Password</b></label>
                        <input class="form-control" type="password" name="password" value="<%=emp1.getPassword()%>" />
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
<!-- End of Page Content -->
<%@include file="layout/footer.jsp" %>
<%
    session.removeAttribute("listEmployee");
    session.removeAttribute("employee");
%>
</html>
