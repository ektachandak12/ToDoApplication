# 📝 ToDo Application

A simple and efficient **Java-based To-Do List Web Application** built using **JSP, Servlets, Hibernate, and MySQL**. The application allows users to create, view, update, and delete tasks while maintaining persistent storage through Hibernate ORM.

## 🚀 Features

* ✅ Add new tasks with title, description, and priority
* 📋 View all saved tasks
* ✏️ Edit and update existing tasks
* 🗑️ Delete tasks
* 🕒 Automatically records the date and time when a task is created or updated
* 💾 Persistent data storage using Hibernate and MySQL
* 🎨 Simple JSP-based user interface with reusable components

---

## 🛠️ Tech Stack

### Backend

* Java
* Java Servlets
* Hibernate ORM

### Frontend

* JSP (JavaServer Pages)
* HTML
* CSS

### Database

* MySQL

### Build Tool

* Maven

### Server

* Apache Tomcat (or any Servlet Container)

---

## 📂 Project Structure

```
ToDoApplication/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com/
│   │   │   │   ├── entities/
│   │   │   │   │   └── ToDoApp.java
│   │   │   │   ├── helper/
│   │   │   │   │   └── FactoryProvider.java
│   │   │   │   └── servlet/
│   │   │   │       ├── SaveTaskServlet.java
│   │   │   │       ├── UpdateServlet.java
│   │   │   │       └── DeleteServlet.java
│   │   │
│   │   ├── resources/
│   │   │   └── hibernate.cfg.xml
│   │   │
│   │   └── webapp/
│   │       ├── index.jsp
│   │       ├── addTasks.jsp
│   │       ├── all_tasks.jsp
│   │       ├── edit.jsp
│   │       ├── navbar.jsp
│   │       ├── all_js_css.jsp
│   │       └── css/
│   │           └── style.css
│
├── pom.xml
└── README.md
```

---

## 🏗️ Architecture

The application follows a layered architecture:

```
User
   │
   ▼
JSP Pages
   │
   ▼
Servlets
   │
   ▼
Hibernate ORM
   │
   ▼
MySQL Database
```

* **JSP** handles the presentation layer.
* **Servlets** process user requests and business logic.
* **Hibernate** manages object-relational mapping and database operations.
* **MySQL** stores all task information.

---

## ⚙️ Core Functionalities

### 1. Add Task

Users can create a new task by providing:

* Title
* Description
* Priority

The application automatically stores the current timestamp.

### 2. View Tasks

Displays all saved tasks with their details for easy tracking.

### 3. Update Task

Existing tasks can be modified, including:

* Title
* Description
* Priority

The modification time is updated automatically.

### 4. Delete Task

Removes a task permanently from the database.

---

## 🗃️ Entity Model

The `ToDoApp` entity contains:

| Field         | Description                    |
| ------------- | ------------------------------ |
| `id`          | Unique task identifier         |
| `title`       | Task title                     |
| `description` | Task description               |
| `date`        | Creation/last update timestamp |
| `priority`    | Priority level of the task     |

---

## 📦 Hibernate Configuration

Hibernate is configured using `hibernate.cfg.xml` and uses a `SessionFactory` managed by `FactoryProvider.java` for database connectivity and session management.

---

## ▶️ Getting Started

### Prerequisites

* Java 8 or above
* Maven
* MySQL
* Apache Tomcat

### Clone the repository

```bash
git clone https://github.com/ektachandak12/ToDoApplication.git
```

### Configure the database

Update the MySQL credentials in `hibernate.cfg.xml`.

### Build the project

```bash
mvn clean install
```

### Deploy

Deploy the generated WAR file to Apache Tomcat and start the server.

### Access

```
http://localhost:8080/ToDoApplication
```

---

## 📚 Key Concepts Demonstrated

* Java Servlets
* JSP-based MVC pattern
* Hibernate ORM
* CRUD Operations
* Maven project management
* SessionFactory implementation
* MySQL database integration

---

## 🔮 Future Enhancements

* User authentication and authorization
* Task completion status
* Due dates and reminders
* Search and filtering
* Categories and labels
* Pagination
* REST API integration
* Spring Boot migration
* Responsive UI with Bootstrap

---

## 👩‍💻 Author

**Ekta Chandak**

B.Tech in Artificial Intelligence & Data Science

GitHub: https://github.com/ektachandak12

---

## 📄 License

This project is intended for educational and learning purposes.
