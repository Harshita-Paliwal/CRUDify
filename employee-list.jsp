<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("<%=request.getContextPath()%>/images/emplistbg.jpg") no-repeat center center/cover;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 60px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9); /* semi-transparent white background */
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .table th {
            background-color: #006666;
            color: white;
        }

        .table td {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body onload="makeActive('list')">
    <div class='container mt-5'>
        <div class='card col-md-12 mx-auto' style='border:3px solid silver'>
            <div class='card-body'>
                <div class='table scrollit'>
                    <table class='table table-hover'>
                        <thead>
                            <tr>
                                <th>Employee id</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Phone number</th>
                                <th>Email Id</th>
                                <th>Department</th>
                                <th>Sub-Department</th>
                                <th>Salary</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/wjsp12", "root", "mysql");
                                Statement st = cn.createStatement();
                                ResultSet rst = st.executeQuery("SELECT * FROM employeeinfo");
                                while (rst.next()) {
                            %>
                            <tr>
                                <td><%=rst.getString(1)%></td>
                                <td><%=rst.getString(2)%></td>
                                <td><%=rst.getString(3)%></td>
                                <td><%=rst.getString(4)%></td>
                                <td><%=rst.getString(5)%></td>
                                <td><%=rst.getString(6)%></td>
                                <td><%=rst.getString(7)%></td>
                                <td><%=rst.getString(8)%></td>
                            </tr>
                            <%
                                }
                                rst.close();
                                st.close();
                                cn.close();
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
