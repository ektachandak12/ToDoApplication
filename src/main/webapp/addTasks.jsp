<%--
  Created by IntelliJ IDEA.
  User: Tech Bazaar
  Date: 21-02-2026
  Time: 11:35 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Task</title>

    <%@include file="all_js_css.jsp"%>


</head>
<body>
<div class = "container">
    <%@include file="navbar.jsp"%>
    <h1>Please enter task details</h1>
    <br>

    <%
        String msg = (String) session.getAttribute("message");
        if (msg != null) {
    %>
    <div class="alert alert-success">
        <%= msg %>
    </div>
    <%
            session.removeAttribute("message");
        }
    %>


    <%--This is add form secton --%>
    <form action = "SaveTaskServlet" method = "POST">
        <div class="form-group">
            <label for="title">Task title</label>
            <input
                    name = "title"
                    required
                    type="text"
                    class="form-control"
                    id="title"
                    aria-describedby="emailHelp"
                    placeholder="Enter task title" />
        </div>
        <div class="form-group">
            <label for="Task Description">Description</label>
            <textarea
                    name = "description"
                    required
                    id="description"
                    placeholder="Enter task description"
                    class="form-control"
                    style = "height:150px"
            ></textarea>
        </div>
        <label for="priority">Priority</label>
        <select id="priority" name="priority">
            <option value="Low">Low</option>
            <option value="Medium">Medium</option>
            <option value="High">High</option>
        </select>

        <div class="container text-center">
        <button type="submit" class="btn btn-primary">Add task</button>
        </div>
    </form>
</div>

</body>
</html>
