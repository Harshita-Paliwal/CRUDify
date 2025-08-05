<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="navbar.jsp" %>
<html>
<head>
  <title>CRUDify - Home</title>
  
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Segoe UI', sans-serif;
    }

    .hero-section {
  background: url("<%=request.getContextPath()%>/images/bg.jpg") no-repeat center center / cover;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  color: white;
  text-align: center;
  position: relative;
}


    .hero-section::before {
      content: "";
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.4); /* Overlay */
      z-index: 1;
    }

    .hero-content {
      z-index: 2;
    }

    .hero-content h2 {
      font-size: 3vw;
      margin-bottom: 10px;
      color: #00ccff;
    }

    .hero-content h1 {
      font-size: 4vw;
      font-weight: bold;
    }
  </style>
</head>

<body onload="makeActive('home')">

  <div class="hero-section">
    <div class="hero-content">
      <h2>Welcome!</h2>
      <h1><strong>CRUDify</strong> – Your Employee Manager</h1>
    </div>
  </div>

</body>
</html>