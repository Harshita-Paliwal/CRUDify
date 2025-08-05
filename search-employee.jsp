<%@ include file="navbar.jsp" %>
<html>
<head>
    <style>
        body {
            background: url("<%=request.getContextPath()%>/images/searchbg.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .ta {
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(0, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .pad {
            padding: 10px;
        }

        label {
            font-size: 20px;
            color: #000;
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
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body onload="makeActive('search')">
   <form action="search-record.jsp">
    <table class='ta'>
     <tr>
      <td class='pad'><label>Enter employee id</label></td>
      <td class='pad'>
      	<input type="number" name="eid" required>
      </td>
      <td class='pad'>
       <button type="submit">Search Record</button>
      </td>
     </tr>
    </table>
   </form>
</body>
</html>
