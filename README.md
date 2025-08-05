✨ CRUDify – A Simple Employee Management System 🧑‍💼

**Have a look at the website first and check the notes below for setup instructions.**
---
![Homepage](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Homepage.png)
![Insert1](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Insert1.png)
![Insert2](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Insert2.png)
![Emplist](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Emplist.png)
![Delete](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Delete.png)
![Update](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Update.png)
![Search](https://github.com/Harshita-Paliwal/CRUDify/blob/c575008b9117f4d00d6c1ee58e6726fe907f303c/Search.png)
---
🔧 Features:
Implemented Create, Read, Update, Delete (CRUD) operations on employee records.

Built using MVC architecture to ensure modularity and maintainability.

Designed user-friendly JSP pages with integrated form validations.

Connected securely to MySQL database via JDBC with proper exception handling.

Structured using webapp/WEB-INF/META-INF conventions for deployable war packaging.
---
⚙️ Configuration Note
🔒 **Update the JDBC credentials** in your connection code as shown below:
```java
String url = "jdbc:mysql://localhost:3306/your_database_name";
String user = "your_db_username";
String pass = "your_db_password";
📌 Instead of hardcoding the connection in every file, it's recommended to optimize JDBC setup using a ServletContextListener to load the driver once globally.
---
📦 Requirements
Java 8+
Apache Tomcat 9+
MySQL Server
---
Required Libraries:
    mysql-connector-java-8.x.x.jar
    servlet-api.jar (usually bundled with Tomcat)
---
⚠️ Make sure to manually add these JARs to your project’s lib folder or build path.
---
🚀 How to Run
Deploy the project on Apache Tomcat 9.0+
Ensure MySQL server is running and schema is set
Update JDBC connection info in your project
Add required JAR files
Launch on browser via http://localhost:8080/CRUDify
---
📁 Tech Stack:
Java • JSP • Servlets • JDBC • MySQL • HTML/CSS • Tomcat
