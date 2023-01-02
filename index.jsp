<%-- 
    Document   : index
    Created on : Jan 2, 2023, 6:39:54 PM
    Author     : patce
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Step 1 -create form -->
        <form action="index.jsp">
            Add new item: <input type="text" name="theItem"/>
            <input type="submit" value="Add"/>
        </form>
        <br>
        Item entered: <%= request.getParameter("theItem")%>
        <!-- Step 2 - add new item -->
        <%
        //Getting items from the session
        List<String> items = (List<String>) session.getAttribute("myToDoList");
        //Creating new on incase it doesn't exist
        if(items == null)
        items = new ArrayList<String>();
        session.setAttribute("myToDoList", items);
        //adding data to the list
        String theItem = request.getParameter("theItem");
        if(theItem !=null)
        {
            items.add(theItem);
        }
        %>
        <!-- Step 3 - display to do list in a session-->
        <hr>
        <b> List Items:</b><br/>
        <ol>
            <%
                for(String temp: items)
                out.println("<li>" + temp + "</li>");
            
            %>
        </ol>

    </body>
</html>
