<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="rank.RankDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="rank" class="rank.Rank" scope="page"/>
<jsp:setProperty name="rank" property="num1"/>
<jsp:setProperty name="rank" property="num2"/>
<jsp:setProperty name="rank" property="num3"/>
<jsp:setProperty name="rank" property="num4"/>
<jsp:setProperty name="rank" property="num5"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}
		else{			
			RankDAO rank_check = new RankDAO();
			
			int result = rank_check.write(user_id, rank.getNum1(), rank.getNum2(), rank.getNum3(), rank.getNum4(), rank.getNum5());
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('여행지 등록 실패')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('여행지 등록 성공')");
				script.println("location.href='map.jsp'");
				script.println("</script>");
			}
		}

%>
</body>
</html>