package com.entities;


import jakarta.persistence.*;

import java.util.Random;


@Entity
@Table(name = "ToDoList")
public class ToDoApp {
    @Id
    private int id;
    private String title;
    @Column(length = 500)
    private String description;
    private String date;


    @Column(name = "priority")
    private String priority;

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public ToDoApp(String title, String description, String date, String priority) {
        super();
        this.id = new Random().nextInt(10000);
        this.title = title;
        this.description = description;
        this.date = date;
        this.priority = priority;
    }

    public ToDoApp() {
        super();
    }
}
