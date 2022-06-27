<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Test Method</title>
</head>
<body>
<h4><b>TEST OUTPUT DATABASE</b></h4>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>email</th>
        <th>passwd</th>
        <th>money</th>
        <th>role_access_level</th>
    </tr>
    <%
        try{
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                    "postgres", "root");
            Statement statement = connection.createStatement();
            String sql = "Select * from \"Person\"";
            ResultSet rs = statement.executeQuery(sql);

            while(rs.next()){
            %>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("passwd")%></td>
                <td><%=rs.getFloat("money")%></td>
                <td><%=rs.getInt("role_access_level")%></td>
            </tr>
            <% }
        } catch(Exception e){
            e.printStackTrace();
        }
            %>
</table>
<br><br>
<br><br>

<h4><b>OUTPUT USER NAME FROM DATABASE</b></h4>

<p>Manager name:</p>
<br>
<%
    try{
        Class.forName("org.postgresql.Driver");
        Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                "postgres", "root");
        Statement statement = connection.createStatement();
        String sql = "Select * from \"Person\" where \"role_access_level\" = 4";
        ResultSet rs = statement.executeQuery(sql);

        while(rs.next()){
        %>
        <%=rs.getString("name")%>
        <% }
    } catch(Exception e){
         e.printStackTrace();
    }
%>
</body>
</html>
