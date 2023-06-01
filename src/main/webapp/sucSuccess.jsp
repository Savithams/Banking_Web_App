<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String account = request.getParameter("account");
		String amount = request.getParameter("amount");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/com","root","root");
			PreparedStatement stmt = conn.prepareStatement("insert into bank2 values(?,?)");
			stmt.setString(1, amount);
			stmt.setString(2, account);
			int i = stmt.executeUpdate();
			if(i>0) {
				out.println("Amount is deposited Successfully");
				out.println("<html><body>");
				out.println("<a href='showRecord.jsp'>Show records</a>");
				out.println("</body></html>");
			}
			
		}catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
%>
</body>
</html>