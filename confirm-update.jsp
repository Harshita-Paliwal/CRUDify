<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("images/updatebg.jpg") no-repeat center center fixed;
            background-size: cover;
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
        input[type="text"] {
            width: 100%;
            padding: 6px;
            border: 1px solid gray;
            border-radius: 4px;
        }
        button {
            padding: 10px;
            width: 48%;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button.confirm {
            background-color: green;
            color: white;
        }
        button.cancel {
            background-color: red;
            color: white;
        }
        .error-box {
            width: 50%;
            margin: 100px auto;
            padding: 50px;
            text-align: center;
            background-color: #ffe0b2;
            color: #d84315;
            font-size: 18px;
            font-weight:bolder;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.4);
        }
    </style>
</head>
<body onload="makeActive('update')">
<%
    String eid = request.getParameter("eid");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/wjsp12", "root", "mysql");
    PreparedStatement ps = cn.prepareStatement("SELECT * FROM employeeinfo WHERE eid=?");
    ps.setString(1, eid);
    ResultSet rst = ps.executeQuery();

    if (rst.next()) {
%>
<form action="update-record.jsp">
    <table class='tar' border='1'>
        <tr>
            <th colspan="2">Employee Details</th>
        </tr>
        <tr>
            <th>Employee Id</th>
            <td><%=eid%><input type="hidden" value="<%=eid%>" name='eid'></td>
        </tr>
        <tr>
            <th>First name</th>
            <td><input type="text" name="firstname" value="<%=rst.getString(2)%>"></td>
        </tr>
        <tr>
            <th>Last name</th>
            <td><input type="text" name="lastname" value="<%=rst.getString(3)%>"></td>
        </tr>
        <tr>
            <th>Phone number</th>
            <td><input type="text" name="phone" value="<%=rst.getString(4)%>"></td>
        </tr>
        <tr>
            <th>Email id</th>
            <td><input type="text" name="emailid" value="<%=rst.getString(5)%>"></td>
        </tr>
        <tr>
            <th>Department</th>
            <td><input type="text" name="dept" value="<%=rst.getString(6)%>"></td>
        </tr>
        <tr>
            <th>Sub-Department</th>
            <td><input type="text" name="subdept" value="<%= (rst.getString(7)!=null)?rst.getString(7):"" %>"></td>
        </tr>
        <tr>
            <th>Salary</th>
            <td><input type="text" name="salary" value="<%= (rst.getString(8)!=null)?rst.getString(8):"" %>"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button class="confirm">Confirm Update</button>
                <a href="update-employee.jsp"><button type="button" class="cancel">Cancel</button></a>
            </td>
        </tr>
    </table>
</form>
<%
    } else {
%>
<div class="error-box">
   <u>Employee record with ID <%=eid%> does not exist!</u>
</div>
<%
    }
    cn.close();
%>
</body>
</html>




