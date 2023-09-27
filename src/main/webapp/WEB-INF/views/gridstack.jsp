<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>문서함</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/gridstack.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/gridstack-extra.css" />
		<script type="text/javascript" src="resources/lib/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="resources/lib/gridstack-poly.js"></script>
		<script type="text/javascript" src="resources/lib/gridstack-all.js"></script>
		
		<style type="text/css">
		  .grid-stack { background: #FAFAD2; }
		  .grid-stack-item-content { background-color: #18BC9C; }
		</style>
		
		<script>
			addEventListener("DOMContentLoaded", (event) => {
				/* var items = [
				    {content: 'my first widget'}, // will default to location (0,0) and 1x1
				    {w: 2, content: 'another longer widget!'} // will be placed next at (1,0) and 2x1
				  ]; */
				  
				  document.getElementById('addBtn').addEventListener('click', (e) => {
					  console.log('click');
					  grid.addWidget({w: 1, h: 1, content: 'hello'});
				  })
				  
				const gridOption = {
					auto: false
					, float: true
					, oneColumnSize: 1440
					, maxRow: 3
					, minRow: 3
					, column: 10
					, cellHeight: 360
					, animate: true
				    , draggable: {
				        handle: '.panel-heading',
				    }
				}
				const items = [
					  {x: 0, y: 0, w: 2, h: 1, content: '<h3 style="background-color: red;" class="panel-heading">TEST1</h3><div style="padding:10px;"><iframe frameborder="0" marginwidth="0" marginheight="0" scrolling="" style="width: 100%; height: 100%; border: 0;" src="/page1"></iframe></div>'},
					  {x: 0, y: 1, w: 2, h: 1, content: '<h3 style="background-color: red;" class="panel-heading">TEST2</h3><div><iframe frameborder="0" marginwidth="0" marginheight="0" scrolling="" style="width: 100%; height: 100%; border: 0;" src="/page2"></iframe></div>'},
					  {x: 0, y: 2, w: 2, h: 1, content: '<iframe style="width: 100%; height: 100%; border: 0;" src="/page1"></iframe>'}
				];
				var grid = GridStack.init(gridOption);
//				grid.movable(grid.getColumn(1), false);
				grid.load(items);
				grid.movable(grid.getGridItems()[0], false);
				grid.resizable(grid.getGridItems()[0], false);
			});
		</script>
	</head>
	<body>
		<h1>gridstack</h1>
		<button id="addBtn">항목 추가</button>
		<div class="grid-stack"></div>
	</body>
</html>
