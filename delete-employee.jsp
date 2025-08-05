<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("<%=request.getContextPath()%>/images/deletebg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .ta {
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(255, 0, 0, 0.2);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        .pad {
            padding: 10px;
        }

        label {
        font-weight:bold;
            font-size: 20px;
            color: black;
        }

        input[type="number"] {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-delete {
            background-color: red;
            color: white;
        }

        .btn-delete:hover {
            background-color: darkred;
        }
    </style>
</head>
<body onload="makeActive('delete')">
   <form action="confirm-delete.jsp">
    <table class='ta'>
     <tr>
      <td class='pad'><label>Enter employee id : </label></td>
      <td class='pad'><input type="number" name="eid" required></td>
      <td class='pad'>
       <button type="submit" class="btn-delete">Delete Record</button>
      </td>
     </tr>
    </table>
   </form>
</body>
</html>
