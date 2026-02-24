package com.servlet;

import com.entities.ToDoApp;
import com.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveTaskServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        try{

            //Fetching title and description
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            Date currentDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String formattedDate = sdf.format(currentDate);
            String priority = request.getParameter("priority");
            ToDoApp task = new ToDoApp(title, description, formattedDate, priority);


            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            s.save(task);

            tx.commit();
            s.close();

            request.getSession().setAttribute("message", "Task saved successfully!");
            response.sendRedirect("addTasks.jsp");



        }catch(Exception ex){
            ex.printStackTrace();
        }

    }
}