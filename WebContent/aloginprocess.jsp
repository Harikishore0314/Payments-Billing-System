<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
		/* String username=getServletContext().getInitParameter("Username");
		String password=getServletContext().getInitParameter("Password"); */
		String username=request.getParameter("username");
		String password=request.getParameter("userpass");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/payments","root","9912");

		PreparedStatement ps=con.prepareStatement("select * from adminlogin where user=? and userpass=?");
		ps.setString(1,username);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();	
if(rs.next())
{
session.setAttribute("islogin","plz sign in first");
%>
<jsp:forward page="ahome.jsp"></jsp:forward>
<% 
}

else{
request.setAttribute("Error","Sorry! Username or Password Error. plz Enter Correct Detail");
session.setAttribute("Loginmsg","plz sign in first");
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<% 
}
%>

