<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>page1</title>
		<meta charset="utf-8">
	</head>
	<script type="text/javascript" src="resources/lib/jquery-3.4.1.min.js"></script>
	<style>
		body {
			background-color: black;
		}
		h1 {
			color: white;
		}
	</style>
	<script>
		addEventListener("DOMContentLoaded", (event) => {
			$('#test').on('click', function(e) {
				console.log('click');
				parent.$('#modal').show();
			})
		});
	</script>
	<body>
		<h1>page1</h1>
		<button id="test">test</button>
	</body>
</html>
