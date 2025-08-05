<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="navbar.jsp" %>
<html>
<head>
  <style>
    body {
      background: url("<%=request.getContextPath()%>/images/insertbg.jpg") no-repeat center center/cover;
      background-size: cover;
      background-attachment: fixed;
      font-family: 'Segoe UI', sans-serif;
    }

    .save {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .lamsg {
      background-color: rgba(255,255,255,0.9);
      padding: 20px 30px;
      border-radius: 12px;
      font-size: 20px;
      font-weight: 600;
      box-shadow: 0 8px 24px rgba(0,0,0,0.3);
      color: #000;
    }
  </style>
</head>
<body onload="makeActive('insert')">
<%
    String eid = request.getParameter("eid");
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String phone = request.getParameter("phone");
    String countryCode = request.getParameter("countryCode");
    String fullPhone = countryCode + phone;
    String emailid = request.getParameter("email");
    String dept = request.getParameter("dept");
    String subdept = request.getParameter("subdept");
    String salaryStr = request.getParameter("salary");

    int salary = 0;
    try {
        salary = Integer.parseInt(salaryStr);
    } catch (NumberFormatException e) {
        salary = 0;
    }

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/wjsp12", "root", "mysql");

    PreparedStatement checkPs = cn.prepareStatement("SELECT * FROM employeeinfo WHERE eid = ?");
    checkPs.setString(1, eid);
    ResultSet rs = checkPs.executeQuery();

    if (rs.next()) {
%>
    <div class='save'>
      <label class='lamsg' style='color:red;'>Employee ID <%=eid%> already exists. Please use a different ID.</label>
    </div>
<%
    } else {
      PreparedStatement ps = cn.prepareStatement("INSERT INTO employeeinfo VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
      ps.setString(1, eid);
      ps.setString(2, firstname);
      ps.setString(3, lastname);
      ps.setString(4, fullPhone);
      ps.setString(5, emailid);
      ps.setString(6, dept);
      ps.setString(7, subdept);
      ps.setInt(8, salary);  
      ps.executeUpdate();
%>
    <div class='save'>
      <label class='lamsg' style='color:green;'><b>Employee record has been inserted successfully !</b></label>
    </div>
<%
      ps.close();
    }

    checkPs.close();
    rs.close();
    cn.close();
%>
</body>
</html>