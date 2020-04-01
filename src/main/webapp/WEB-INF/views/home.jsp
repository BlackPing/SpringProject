<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>문서함</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
		<script type="text/javascript" src="resources/lib/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="resources/blackping/util.js"></script>
		<script type="text/javascript" src="resources/blackping/paging.js"></script>
		<script>
		/* PAGING - code by black_ping
		page_index: 현재 페이지
		page_count: 출력할 리스트
		
	*/
		let paging = { page_index: 0, page_count: 5 }
			$(document).ready(function () {
				pagingView(paging, 0);
				
				console.log("test");
				
				$('button').on('click', (e) => {
					getNet('GET', '/rest/selectList', paging, true, (data) => {
						console.log(data);
						if(data.status.response != 200) {
							alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
							return;
						}
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
		<div>
			<div id="board">
				<table>
					<thead>
						<tr>
							<th>test1</th>
							<th>test2</th>
							<th>test3</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
						</tr>
					</tbody>
				</table>
				<div id="board_page">page</div>
			</div>
		</div>
	</body>
</html>
