<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.entities.ToDoApp" %><%--
  Created by IntelliJ IDEA.
  User: Tech Bazaar
  Date: 22-02-2026
  Time: 07:24 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="all_js_css.jsp" %>
</head>
<body>
<div class = "container">
    <%@include file="navbar.jsp"%>
    <h1>Edit task</h1>
    <br>

    <%
        int task_id = Integer.parseInt(request.getParameter("task_id").trim());

        Session s = FactoryProvider.getFactory().openSession();

        ToDoApp task = s.get(ToDoApp.class, task_id);
    %>

    <%--This is add form secton --%>
    <form action = "UpdateServlet" method = "POST">
        <input value = "<%= task.getId()%>" name = "task_id" type = "hidden" />
        <div class="form-group">
            <label for="title">Task title</label>
            <input
                    name = "title"
                    required
                    type="text"
                    class="form-control"
                    id="title"
                    aria-describedby="emailHelp"
                    placeholder="Enter task title"
                    value = "<%= task.getTitle() %>"
            />
        </div>
        <div class="form-group">
            <label for="Task Description">Description</label>
            <textarea
                    name = "description"
                    required
                    id="description"
                    placeholder="Enter task description"
                    class="form-control"
                    style = "height:150px"><%=task.getDescription()%>
            </textarea>
            <div class="form-group">
                <label for="Priority">Priority</label>
                <select id = "Priority" name = "priority">
                    <option value="Low">Low</option>
                    <option value="Medium">Medium</option>
                    <option value="High">High</option>
                </select>
            </div>
        </div>

        <div class="container text-center">
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
    </form>

</div>
</body>
</html>
