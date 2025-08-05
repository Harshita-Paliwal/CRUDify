<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script src='JS/script.js'></script>
<link href="CSS/employee.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- 🔥 Custom Navbar Styling -->
<style>
  .navbar-custom {
    background-color: rgba(255, 255, 255, 0.7); /* soft glass effect */
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 0.8rem 2rem;
    border-radius: 0 0 20px 20px;
    position: sticky;
    top: 0;
    z-index: 10;
  }

  .nav-link {
    font-weight: 500;
    color: #004c99 !important;
    margin: 0 12px;
    font-size: 1.05rem;
    transition: all 0.3s ease;
  }

  .nav-link:hover {
    color: #007BFF !important;
    transform: scale(1.05);
  }

  .nav-link.active {
    background-color: #007BFF !important;
    color: white !important;
    border-radius: 20px;
    padding: 6px 16px;
  }
</style>

<!-- 🔗 Navbar -->
<nav class='navbar navbar-expand navbar-custom'>
  <ul class='nav nav-pills mx-auto'>
    <li><a id="home" class='nav-link' href='/employee-crud'>Home</a></li>
    <li><a id="insert" class='nav-link' href='insert-employee.jsp'>Insert</a></li>
    <li><a id="list" class='nav-link' href='employee-list.jsp'>Employee List</a></li>
    <li><a id="delete" class='nav-link' href='delete-employee.jsp'>Delete</a></li>
    <li><a id="edit" class='nav-link' href='update-employee.jsp'>Update</a></li>
    <li><a id="search" class='nav-link' href='search-employee.jsp'>Search</a></li>
  </ul>
</nav>
