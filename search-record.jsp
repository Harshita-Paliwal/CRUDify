<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            background: url("<%=request.getContextPath()%>/images/searchbg.jpg") no-repeat center center/cover;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }

        .tar {
    margin: 60px auto;
    width: 60%;
    border-collapse: collapse;
    background-color: #ffffff; /* Fully white table background */
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    font-family: 'Segoe UI', sans-serif;
    color: #000000; /* Black text */
}

.tar th, .tar td {
    padding: 16px 22px;
    text-align: left;
    font-size: 16px;
    border-bottom: 1px solid #e0e0e0;
}

.tar th[colspan="2"] {
    background-color: #000000; /* Black header */
    color: white;              /* White heading text */
    font-size: 22px;
    text-align: center;
    border-radius: 12px 12px 0 0;
    border: none;
}

.tar tr:last-child td {
    border-bottom: none;
}

/* Button style */
.btn-small {
    margin-top: 10px;
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    background-color: #4CAF50;
    color: white;
    font-size: 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
.tar, 
.tar tr, 
.tar td {
    background-color: #ffffff !important; /* Force white */
    color: #000000; /* Black text */
}

.btn-small:hover {
    background-color: #388E3C;
}

        .not-found-box {
            margin: 80px auto;
            width: 50%;
            text-align: center;
            background-color: rgba(255, 235, 59, 0.85);
            color: #333;
            padding: 20px;
            font-size: 18px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body onload="makeActive('search')">
<%
    String eid = request.getParameter("eid");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/wjsp12", "root", "mysql");
    PreparedStatement ps = cn.prepareStatement("select * from employeeinfo where eid=?");
    ps.setString(1, eid);
    ResultSet rst = ps.executeQuery();
    if (rst.next()) {
%>
<%@ include file="navbar.jsp" %>
<table class='tar' border='1'>
    <tr>
        <th colspan="2">Employee Details</th>
    </tr>
    <tr><th>Employee Id</th><td><%=rst.getString(1)%></td></tr>
    <tr><th>First name</th><td><%=rst.getString(2)%></td></tr>
    <tr><th>Last name</th><td><%=rst.getString(3)%></td></tr>
    <tr><th>Phone number</th><td><%=rst.getString(4)%></td></tr>
    <tr><th>Email id</th><td><%=rst.getString(5)%></td></tr>
    <tr><th>Department</th><td><%=rst.getString(6)%></td></tr>
    <tr><th>Sub-Department</th><td><%= (rst.getString(7) != null) ? rst.getString(7) : "—" %></td></tr>
    <tr><th>Salary</th><td>&#8377;<%= (rst.getString(8) != null) ? rst.getString(8) : "—" %></td></tr>
    <tr>
        <td colspan="2" align="center">
            <a href="index.jsp"><button type="button" class="btn-small">Go Back Home</button></a>
        </td>
    </tr>
</table>
<%
    } else {
%>
<jsp:include page="search-employee.jsp" />
<div class='not-found-box'>
    ❌ Employee record with ID <%=eid%> not found.
</div>
<%
    }
%>
</body>
</html>
