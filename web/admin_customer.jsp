<%-- 
    Document   : admin_customer
    Created on : Jul 29, 2019, 9:00:14 AM
    Author     : Bella
--%>

<%@page import="models.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>    
    <!-- Page Content -->    
    <div class="main">
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Customer</h1>
                        <!--Table-->
                        <%
                            List<Customer> listCustomer = (List<Customer>) session.getAttribute("listCustomer");
                            Customer customer = (Customer) session.getAttribute("customer");
                            if (session.getAttribute("listCustomer") == null) {
                                response.sendRedirect("CustomerServlet");
                            }
                        %>
                        <div align="right">
                            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#modalInsert">Insert Data</button>
                        </div>
                        <br>
                        <br>
                        <div align="center" >
                            <table  class="table table-striped table-bordered" style="width: 90%" id="customerTable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>PIC</th>
                                        <th>Address</th>
                                        <th>Phone</th>
                                        <th>Email</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (session.getAttribute("listCustomer") != null) {
                                            for (Customer cus : listCustomer) {
                                    %>
                                    <tr>
                                        <td></td>
                                        <td><%=cus.getId()%></td>
                                        <td><%=cus.getName()%></td>
                                        <td><%=cus.getPic()%></td>
                                        <td><%=cus.getAddress()%></td>
                                        <td><%=cus.getPhone()%></td>
                                        <td><%=cus.getEmail()%></td>
                                        <td><a class="btn btn-danger"  href="CustomerServlet?action=delete&id=<%=cus.getId()%>">Delete</a>
                                            <a class="btn btn-primary" href=# data-toggle="modal" data-target="#modalEdit<%=cus.getId()%>" >Update</a>
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

    <div class="modal fade" id="modalInsert" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="CustomerServlet" method="POST">
                        <label><b>ID</b></label>
                        <input class="form-control" type="text" name="id" value="<%=(customer != null) ? customer.getId() : ""%>"/>
                        <br>
                        <label><b>Name</b></label>
                        <input class="form-control" type="text" name="name" value="<%=(customer != null) ? customer.getName() : ""%>" />
                        <br>
                        <label><b>PIC</b></label>
                        <input class="form-control" type="text" name="pic" value="<%=(customer != null) ? customer.getPic() : ""%>" />
                        <br>
                        <label><b>Address</b></label>
                        <input class="form-control" type="text" name="address" value="<%=(customer != null) ? customer.getAddress() : ""%>" />
                        <br>
                        <label><b>Phone</b></label>
                        <input class="form-control" type="text" name="phone" value="<%=(customer != null) ? customer.getPhone() : ""%>" />
                        <br>
                        <label><b>Email</b></label>
                        <input class="form-control" type="text" name="email" value="<%=(customer != null) ? customer.getEmail() : ""%>" />
                        <br>
                        <input  type="submit" value="Save" class="btn btn-success" id="insert">
                    </form>
                </div>
            </div>
        </div>
    </div>
                        
    <!-- Modal Edit -->
    <%if (session.getAttribute("listCustomer") != null) {
            for (Customer c : listCustomer) {%>
    <div class="modal fade" id="modalEdit<%=c.getId()%>" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="CustomerServlet" method="POST">
                        <label><b>ID</b></label>
                        <input class="form-control" type="text" name="id" value="<%=c.getId()%>"/>
                        <br>
                        <label><b>Name</b></label>
                        <input class="form-control" type="text" name="name" value="<%=c.getName()%>" />
                        <br>
                        <label><b>PIC</b></label>
                        <input class="form-control" type="text" name="pic" value="<%=c.getPic()%>" />
                        <br>
                        <label><b>Address</b></label>
                        <input class="form-control" type="text" name="address" value="<%=c.getAddress()%>" />
                        <br>
                        <label><b>Phone</b></label>
                        <input class="form-control" type="text" name="phone" value="<%=c.getPhone()%>" />
                        <br>
                        <label><b>Email</b></label>
                        <input class="form-control" type="text" name="email" value="<%=c.getEmail()%>" />
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
    <!-- End of Modal Edit -->
<%@include file="layout/footer.jsp"%>    
<%
    session.removeAttribute("listCustomer");
    session.removeAttribute("customer");
%>
</html>
