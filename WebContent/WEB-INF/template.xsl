<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>MeatApp</title>
				<style>
						html,
					body {
						margin: 0;
						padding: 0;
						font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
						font-size: 30px;
					}
					.navbar {
					width: 100%;
					height: 40px;
					background-color: #D32F2F;
					display: flex;
					align-items: center;
					justify-content: space-between;
					padding: 16px;
					}
					.brand {
					text-decoration:none;
					color: #fff;
					}
					.navbar-button {
					margin-right: 50px;
					text-decoration:none;
					color: #fff;
					}
				</style>
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="navbar">
		<nav class="navbar">
			<a class="brand" href="index.jsp">MeatApp</a>
			<xsl:apply-templates />
		</nav>
	</xsl:template>
	
	<xsl:template match="logged-out">
		<div class="navbar-buttons">
			<a class="navbar-button" href="register.jsp">Register</a>
			<a class="navbar-button" href="login.jsp">Login</a>
		</div>
	</xsl:template>
	
	<xsl:template match="logged-in">
		<div class="navbar-buttons">
			<a class="navbar-button" href="logout.jsp">Logout</a>
		</div>
	</xsl:template>
	
	<xsl:template match="main">
		<section class="main-content">
			<h1>Meatings</h1>
			<xsl:apply-templates />
		</section>
	</xsl:template>
	
	<xsl:template match="poll">
		<p><xsl:value-of select="username"/> - <a href="polldetails.jsp?polltitle={title}"> <xsl:value-of select="title"/></a></p>
	</xsl:template>
	
	
</xsl:stylesheet>