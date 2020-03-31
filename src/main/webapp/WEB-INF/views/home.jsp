<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>문서함</title>
		<meta charset="utf-8">
		<script type="text/javascript" src="resources/lib/jquery-3.4.1.min.js"></script>
		<script>
		/* PAGING - code by black_ping
			page_index: 현재 페이지
			page_count: 출력할 리스트
			
		*/
			let paging = { page_index: 0, page_count: 5 }
			$(document).ready(function () {
				function Net_fail() {
				    alert('서버 오류')
				}

				function getNet(Method, URL, DATA, sync, done, fail) {
				    $.ajax({
				    	method: Method, 
				    	url: URL, 
				    	cache: false, 
				    	data: DATA, 
				    	async: sync,
				    	header:{
							"Content-Type":"application/json",	//Content-Type 설정
							"X-HTTP-Method-Override":"" + Method + ""
						}
				    }).done(done).fail(fail);
				}
				
				console.log("test");
				
				$('button').on('click', (e) => {
					getNet('GET', '/rest/selectList', paging, true, (data) => {
						console.log(JSON.parse(data));
					}, Net_fail)
				})
			});
		</script>
	</head>
	<body>
		<button>AJAX</button>
		<h1>
			리스트따리들
			
		</h1>
	</body>
</html>
