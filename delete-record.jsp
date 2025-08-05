<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("<%=request.getContextPath()%>/images/deletebg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
        

        .success-box {
            margin: 100px auto;
            width: 50%;
            text-align: center;
            background-color: rgba(0, 255, 0, 0.7);
            color: white;
            padding: 20px;
            font-size: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body onload="makeActive('delete')">
  <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "your_db_username", "your_db_password");

    String eid = request.getParameter("eid");
    PreparedStatement ps = cn.prepareStatement("delete from employeeinfo where eid=?");
    ps.setString(1, eid);
    int deleted = ps.executeUpdate();
  %>  

  <div class='success-box'>
    <% if (deleted > 0) { %>
        ✅ Employee record with ID <%=eid%> has been deleted successfully
    <% } else { %>
        ❌ No record found to delete with ID <%=eid%>
    <% } %>
  </div>

</body>
</html>
