<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="navbar.jsp"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert Employee | CRUDify</title>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      font-family: 'Segoe UI', sans-serif;
    }

    /* Background section with overlay */
    .bg-section {
      background: url("<%=request.getContextPath()%>/images/insertbg.jpg") no-repeat center center/cover;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 30px;
      position: relative;
    }
    

    .bg-section::before {
      content: '';
      position: absolute;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      z-index: 1;
    }

    /* Card style */
    .insert-card {
      background: #ffffff;
      padding: 35px;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.3);
      width: 80%;
      max-width: 900px;
      z-index: 2;
      position: relative;
      animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
      from {opacity: 0; transform: translateY(30px);}
      to {opacity: 1; transform: translateY(0);}
    }

    h3 {
      text-align: center;
      color: #0d6efd;
      margin-bottom: 20px;
    }

    .form-group label {
      font-weight: 600;
    }

    button.btn-primary {
      width: 100%;
      font-weight: bold;
    }
  </style>
</head>

<body onload="makeActive('insert')">
  <div class="bg-section">
    <div class="insert-card">
      <h3>Insert New Employee</h3>
      <form action="save-record.jsp" method="post" onsubmit="return validateInsertForm()">
        
        <div class='row'>
          <div class='form-group col-md-12'>
            <label>Enter Employee ID <span class="text-danger">*</span></label>
            <input type="number" class='form-control' name='eid' placeholder="Enter ID" required>
          </div>
        </div>

        <div class='row mt-2'>
          <div class='form-group col-md-6'>
            <label>First Name <span class="text-danger">*</span></label>
            <input type="text" class='form-control' name='firstname' placeholder="Enter First Name" required>
          </div>
          <div class='form-group col-md-6'>
            <label>Last Name <span class="text-danger">*</span></label>
            <input type="text" class='form-control' name='lastname' placeholder="Enter Last Name" required>
          </div>
        </div>

        <div class='row mt-2'>
          <div class='form-group col-md-6'>
            <label>Phone Number <span class="text-danger">*</span></label>
            <div style="display: flex; gap: 5px;">
              <select class="form-control" name="countryCode" style="max-width: 100px;">
                <option value="+91" selected>+91 🇮🇳</option>
                <option value="+1">+1 🇺🇸</option>
                <option value="+44">+44 🇬🇧</option>
                <option value="+61">+61 🇦🇺</option>
                <option value="+81">+81 🇯🇵</option>
              </select>
              <input type="tel" inputmode="numeric" pattern="[0-9]{7,15}" class='form-control' name='phone' placeholder="Enter Number" required />
            </div>
          </div>

          <div class='form-group col-md-6'>
            <label>Email ID <span class="text-danger">*</span></label>
            <input type="email" class='form-control' name='email' placeholder="Enter Email" required>
          </div>
        </div>

        <div class='row mt-2'>
          <div class='form-group col-md-6'>
            <label>Department <span class="text-danger">*</span></label>
            <select class="form-control" name="dept" id="dept" required>
              <option value="" disabled selected>Select Department</option>
              <option value="Finance">Finance</option>
              <option value="IT">IT</option>
              <option value="HR">HR</option>
              <option value="Sales">Sales</option>
              <option value="Marketing">Marketing</option>
            </select>
          </div>

          <div class='form-group col-md-6' id="subDeptDiv" style="display: none;">
            <label for="subdept">Sub-Department <span class="text-danger">*</span></label>
            <select class="form-control" name="subdept" id="subdept">
              <option value="" disabled selected>Select Sub-Department</option>
              <option value="Development">Software Development</option>
              <option value="Devops">DevOps</option>
              <option value="Testing">QA/Testing</option>
              <option value="Data Analytics">Data Analytics</option>
              <option value="Cyber Security">Cybersecurity</option>
              <option value="Network Administration">Network Administration</option>
              <option value="Support">Help Desk/Support</option>
              <option value="DBA">Database Administration</option>
            </select>
          </div>
        </div>

        <div class='row mt-2'>
          <div class='form-group col-md-12'>
            <label>Salary <span class="text-danger">*</span></label>
            <input type="number" class='form-control' name='salary' placeholder="Enter Amount" required>
          </div>
        </div>

        <div class='row mt-3'>
          <div class='form-group col-md-12'>
            <button class='btn btn-primary' type="submit">Save Record</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const phoneInput = document.getElementsByName("phone")[0];
      const deptSelect = document.getElementById("dept");
      const subDeptDiv = document.getElementById("subDeptDiv");
      const subDeptSelect = document.getElementById("subdept");

      phoneInput.addEventListener("input", function () {
        this.value = this.value.replace(/[^0-9]/g, '');
      });

      deptSelect.addEventListener("change", function () {
        if (this.value === "IT") {
          subDeptDiv.style.display = "block";
          subDeptSelect.required = true;
        } else {
          subDeptDiv.style.display = "none";
          subDeptSelect.required = false;
          subDeptSelect.value = "";
        }
      });
    });
  </script>
</body>
</html>





