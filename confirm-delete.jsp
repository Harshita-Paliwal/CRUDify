<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
    <style>
        body {
            background: url("<%=request.getContextPath()%>/images/deletebg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }

        .tar {
            margin: 60px auto;
            width: 60%;
            border-collapse: collapse;
            background-color: #ffffff; /* Fully white table */
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            color: #000000;
        }

        .tar th, .tar td {
            padding: 16px 22px;
            text-align: left;
            font-size: 16px;
            border-bottom: 1px solid #e0e0e0;
        }

        .tar th[colspan="2"] {
            background-color: #000000;
            color: white;
            font-size: 22px;
            text-align: center;
            border-radius: 12px 12px 0 0;
            border: none;
        }

        .tar tr:last-child td {
            border-bottom: none;
        }

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
        .btn-small:hover { background-color: #388E3C; }

        .btn-red {
            background-color: red;
        }
        .btn-red:hover {
            background-color: darkred;
        }
        .btn-cancel {
            background-color: gray;
        }
        .btn-cancel:hover {
            background-color: #333;
        }
.tar, 
.tar tr, 
.tar td {
    background-color: #ffffff !important; /* Force white */
    color: #000000; /* Black text */
}
        .not-found-box {
            margin: 80px auto;
            width: 50%;
            text-align: center;
            background-color: rgba(255, 235, 59, 0.95);
            color: black;
            padding: 20px;
            font-size: 18px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body onload="makeActive('delete')">
<%
    String eid = request.getParameter("eid");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "your_db_username", "your_db_password");
    PreparedStatement ps = cn.prepareStatement("select * from employeeinfo where eid=?");
    ps.setString(1, eid);
    ResultSet rst = ps.executeQuery();

    if (rst.next()) {
%>
    <%@ include file="navbar.jsp" %>
    <form action="delete-record.jsp">
      <table class='tar'>
        <tr><th colspan="2">Employee Details</th></tr>
        <tr><th>Employee Id</th><td><%=eid%><input type="hidden" name='eid' value="<%=eid%>"></td></tr>
        <tr><th>First name</th><td><%=rst.getString("firstname")%></td></tr>
        <tr><th>Last name</th><td><%=rst.getString("lastname")%></td></tr>
        <tr><th>Phone number</th><td><%=rst.getString("phone")%></td></tr>
        <tr><th>Email id</th><td><%=rst.getString("emailid")%></td></tr>
        <tr><th>Department</th><td><%=rst.getString("dept")%></td></tr>
        <tr><th>Sub-Department</th>
            <td><%= (rst.getString("subdept")!=null && !rst.getString("subdept").trim().equals(""))?rst.getString("subdept"):"N/A" %></td>
        </tr>
        <tr><th>Salary</th><td>&#8377;<%=rst.getString("salary")%></td></tr>
        <tr>
          <td colspan="2" align="center">
            <button class="btn-small btn-red">Confirm Delete</button>
            <a href="delete-employee.jsp" style="text-decoration:none;">
              <button type="button" class="btn-small btn-cancel">Cancel</button>
            </a>
          </td>
        </tr>
      </table>
    </form>
<%
    } else {
%>
    <jsp:include page="delete-employee.jsp" />
    <div class='not-found-box'>
        ❌ Employee record with ID <%=eid%> does not exist
    </div>
<%
    }
%>
</body>
</html>





