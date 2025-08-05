<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("images/updatebg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .update {
            margin: 100px auto;
            width: 50%;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0,0,0,0.6);
        }
        .update label {
            font-weight: bold;
            font-size: 18px;
        }
        .update input[type="number"] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: none;
            margin: 5px 0;
        }
        .btn-primary {
            background-color: crimson;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: darkred;
        }
    </style>
</head>
<body onload="makeActive('update')">
    <form action="confirm-update.jsp">
        <table class='update'>
            <tr>
                <td class='ue'><label>Enter Employee ID</label></td>
            </tr>
            <tr>
                <td><input type="number" name="eid" required></td>
            </tr>
            <tr>
                <td><button class='btn-primary'>Edit Record</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
