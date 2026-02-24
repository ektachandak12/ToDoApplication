package com.servlet;

import com.entities.ToDoApp;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


public class UpdateServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        public UpdateServlet() {
            super();
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            try {
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int task_id = Integer.parseInt(request.getParameter("task_id").trim());
                String priority = request.getParameter("priority");
                Session s = FactoryProvider.getFactory().openSession();
                Transaction tx = s.beginTransaction();

                ToDoApp task = s.get(ToDoApp.class, task_id);
                task.setTitle(title);
                task.setDescription(description);
                task.setDate(String.valueOf(new Date()));
                task.setPriority(priority);

                tx.commit();
                s.close();

                response.sendRedirect("all_tasks.jsp");

            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

