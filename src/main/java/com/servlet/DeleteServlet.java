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

public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            System.out.println("Delete servlet running...");

            int task_id = Integer.parseInt(request.getParameter("task_id").trim());

            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();

            ToDoApp task = s.get(ToDoApp.class, task_id);

            if(task != null){
                s.delete(task);
            }
            tx.commit();
            s.close();

            response.sendRedirect("all_tasks.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
