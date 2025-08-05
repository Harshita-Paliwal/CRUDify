<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("images/updatebg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        .message-box {
            width: 50%;
            margin: 120px auto;
            padding: 25px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.4);
        }
        .success {
            background-color: #c8e6c9;
            color: #2e7d32;
        }
        .failure {
            background-color: #ffcdd2;
            color: #c62828;
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: gray;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body onload="makeActive('update')">
<%
    String eid = request.getParameter("eid");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String phone = request.getParameter("phone");
    String emailid = request.getParameter("emailid");
    String dept = request.getParameter("dept");
    String subdept = request.getParameter("subdept");
    String salary = request.getParameter("salary");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/wjsp12", "root", "mysql");

    PreparedStatement ps = cn.prepareStatement(
        "UPDATE employeeinfo SET firstname=?, lastname=?, phone=?, emailid=?, dept=?, subdept=?, salary=? WHERE eid=?"
    );

    ps.setString(1, firstname);
    ps.setString(2, lastname);
    ps.setString(3, phone);
    ps.setString(4, emailid);
    ps.setString(5, dept);
    ps.setString(6, subdept);
    ps.setString(7, salary);
    ps.setString(8, eid);

    int updated = ps.executeUpdate();
    cn.close();

    if(updated > 0){
%>  
    <div class="message-box success">
        ✅ Employee record (ID: <%=eid%>) has been updated successfully.
        <br>
        <a href="update-employee.jsp" class="back-btn">Go Back</a>
    </div>
<% 
    } else { 
%>
    <div class="message-box failure">
        ❌ Failed to update record. Employee ID <%=eid%> may not exist.
        <br>
        <a href="update-employee.jsp" class="back-btn">Try Again</a>
    </div>
<% } %>
</body>
</html>
