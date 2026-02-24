<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.entities.ToDoApp" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>All Tasks</title>
    <%@ include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">
    <%@ include file="navbar.jsp" %>
    <br>
    <h1 class="text-uppercase">All Tasks:</h1>

    <div class="row">
        <div class="col-12">

            <%
                Session s = FactoryProvider.getFactory().openSession();
                String hql = "FROM ToDoApp t ORDER BY CASE t.priority " +
                        "WHEN 'High' THEN 1 " +
                        "WHEN 'Medium' THEN 2 " +
                        "WHEN 'Low' THEN 3 ELSE 4 END,"  +
                        "t.date DESC";
                Query<ToDoApp> q = s.createQuery(hql, ToDoApp.class);
                List<ToDoApp> list = q.list();

                for (ToDoApp task : list) {
            %>

            <div class="card mt-3">
                <img class="card-img-top m-4"
                     style="max-width:100px"
                     src="img/clipboard.png"
                     alt="Card image">

                <div class="card-body px-5">
                    <h5 class="card-title"><%= task.getTitle() %></h5>

                    <p class="card-text">
                        <%= task.getDescription() %>
                    </p>

                    <p>
                        <b><%=task.getDate()%></b>
                    </p>

                    <p class="card-text">
                        <%=task.getPriority()%>
                    </p>

                    <p class="text-muted">
                        ID: <%= task.getId() %>
                    </p>

                    <a href="<%= request.getContextPath() %>/DeleteServlet?task_id=<%= task.getId() %>"
                       class="btn btn-danger">Delete</a>
                    <a href="<%= request.getContextPath() %>/edit.jsp?task_id=<%= task.getId() %>"
                       class="btn btn-primary">Edit</a>
                </div>
            </div>

            <%
                }
                s.close();
            %>

        </div>
    </div>
</div>

</body>
</html>