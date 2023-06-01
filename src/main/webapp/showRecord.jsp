<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>RECORDS</h1>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/com","root","root");
	String cmd1 ="select * from user2";
	String cmd2 ="select * from bank2";
	PreparedStatement pst1=conn.prepareStatement(cmd1);
	PreparedStatement pst2=conn.prepareStatement(cmd2);
	ResultSet rs1=pst1.executeQuery();
	ResultSet rs2=pst2.executeQuery();
	while(rs1.next()) {
		
		out.println("Name : "+rs1.getString("username"));
		out.println("Password : "+rs1.getString("password"));
	%>
	<br>
<% 	
}
	while(rs2.next()){
		out.println("Account : "+rs2.getString("account"));
		out.println("Amount : "+rs2.getString("amount"));
		
	%>
	<br>
	<% 
	}
	
	
	
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>
<a href="home.html">Home</a>
</body>
</html>