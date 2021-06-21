<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	
	HttpSession userSession = request.getSession();
	userSession.invalidate();
	response.sendRedirect("login.jsp");
%>