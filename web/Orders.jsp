<%-- 
    Document   : Orders
    Created on : Jun 24, 2022, 1:48:31 PM
    Author     : Admin
--%>

<%@page import="context.DBContext"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    Account auth = (Account) request.getSession().getAttribute("acc");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDao newOrderDAO = new OrderDao(DBContext.getConnection());
        orders = newOrderDAO.userOrders();
        request.setAttribute("orders", orders);
    } else {
        response.sendRedirect("Login.jsp");
        
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="includes/Menu.jsp"></jsp:include>
            <div class="container">
                <div class="card-header my-3">All Orders</div>
                <table class="table table-light">
                    <thead>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orders}" var="o">
                        <tr>
                            <td>${o.getDate()}</td>
                            <td>${o.getName()}</td>
                            <td>${o.getQunatity()}</td>
                            <td>${dcf.format(o.getPrice())}</td>
                            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=${o.getOrderId()}">Cancel Order</a></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <jsp:include page="includes/Footer.jsp"></jsp:include>
    </body>
</html>
