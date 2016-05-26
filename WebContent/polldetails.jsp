<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="uts.wsd.*" %>
<%
	String pollFilePath = application.getRealPath("WEB-INF/polls.xml");
%>
<jsp:useBean id="pollBean" class="uts.wsd.PollBean" scope="application">
	<jsp:setProperty name="pollBean" property="pollFilePath"
		value="<%=pollFilePath%>" />
</jsp:useBean>

<%
	String voted = request.getParameter("voted");
	String title = request.getParameter("polltitle");
	String voterName = request.getParameter("voterName");
	String voterTime = request.getParameter("voterTime");
	Poll poll = pollBean.getPolls().findPoll(title);
%>

<c:set var="xmltext">
<body>

	<head>
		<title></title>
		</head>
	<navbar></navbar>
	
	
<%
	if (poll != null) {
%>

	<p>Poll Title: <%= poll.getTitle() %></p>
	<p>Creator: <%= poll.getCreatorUsername() %></p>
	<p>Creation Date: <%= poll.getCreationDate() %></p>
	<p>Meeting Location: <%= poll.getLocation() %></p>
	<p>Description: <%= poll.getDescription() %></p>
	
<%
	if (voted == null) {
%>
	
	<form action="polldetails.jsp" method="post">
		<input type="hidden" name="polltitle" value="<%= title %>"/>
		<input type="hidden" name="voted" value="yes" />
<%
	for (String time : poll.getTimes().getList()) {	
%>
		<input type="radio" name="voterTime" required value="<%= time %>"><%= time %><br>
<% 
	} 
%>
		<label for="">Name:</label> <input type="text" required placeholder="Name" name="voterName" />
		<input type="submit"  value="vote"/>
	</form>
	
<% 
	} else {
%>
		<h2>Poll Results</h2>
		
<%
		pollBean.getPolls().findPoll(title).addVote(new Vote(voterName, voterTime));
		pollBean.save();
		
		for (Vote vote : pollBean.getPolls().findPoll(title).getVotes()) {
%>
		<p><%= vote.getName() %> <%= vote.getTime() %></p>
<%

%>
	
<% 
	}}} else {
%>
	<p>Poll details not found.</p>
<%	
	}
%>
</body>
</c:set>
<c:import url="WEB-INF/polldetails.xsl" var="xslt" />
<x:transform xml="${xmltext}" xslt="${xslt}" />