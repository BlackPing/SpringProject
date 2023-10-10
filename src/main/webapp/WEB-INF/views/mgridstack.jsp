<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>문서함</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/gridstack.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/gridstack-extra.css" />
		<script type="text/javascript" src="resources/blackping/util.js"></script>
		<script type="text/javascript" src="resources/lib/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="resources/lib/gridstack-poly.js"></script>
		<script type="text/javascript" src="resources/lib/gridstack-all.js"></script>
		
		<style type="text/css">
		  .grid-stack { background: #FAFAD2; }
		  .grid-stack-item-content { background-color: #18BC9C; }
		</style>
		
		<script>
			addEventListener("DOMContentLoaded", (event) => {
				selectLayoutList();
				
				/* var items = [
				    {content: 'my first widget'}, // will default to location (0,0) and 1x1
				    {w: 2, content: 'another longer widget!'} // will be placed next at (1,0) and 2x1
				  ]; */
				  
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
/* 				const items = [
					  {x: 0, y: 0, w: 2, h: 1, content: '<h3 style="background-color: red;" class="panel-heading">TEST1</h3><div style="padding:10px;"><iframe frameborder="0" marginwidth="0" marginheight="0" scrolling="" style="width: 100%; height: 100%; border: 0;" src="/page1"></iframe></div>'},
					  {x: 0, y: 1, w: 2, h: 1, content: '<h3 style="background-color: red;" class="panel-heading">TEST2</h3><div><iframe frameborder="0" marginwidth="0" marginheight="0" scrolling="" style="width: 100%; height: 100%; border: 0;" src="/page2"></iframe></div>'},
					  {x: 0, y: 2, w: 2, h: 1, content: '<iframe style="width: 100%; height: 100%; border: 0;" src="/page1"></iframe>'}
				]; */
				  
				/* const items = [
					  {x: 0, y: 0, w: 2, h: 1, content: 'TEST'},
					  {x: 0, y: 1, w: 2, h: 1, content: 'TEST'},
					  {x: 0, y: 2, w: 2, h: 1, content: 'TEST'}
				]; */
				
				const items = [];
				var grid = GridStack.init(gridOption);
				grid.load(items);
				grid.enableMove(false);
				grid.enableResize(false);
				
				$("#layoutList").on("change", function(){
					var value = $(this).val();
					console.log(value);
					if(value == '') return;
				    getNet('GET', '/rest/selectLayoutContent', {layoutNo: value}, true, (data) => {
						if(data.status.response != 200) {
							alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
							return;
						} else {
							grid.removeAll();
							console.log(data);
							data = data.row.result;
							for(let i = 0; i < data.length; i++) {
								data[i].content = '<iframe style="width: 100%; height: 100%; border: 0;" src="' + data[i].LAYOUT_CONTENT + '"></iframe>';
							}
							grid.load(data);
						}
					}, Net_fail);
				});
			});
			
			function selectLayoutList() {
				getNet('GET', '/rest/selectLayout', {layoutNm: $('#layoutNm').val()}, true, (data) => {
					if(data.status.response != 200) {
						alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
						return;
					} else {
						data = data.row.result;
						$layoutList = $('#layoutList');
						
						$layoutList.html('');
						
						$layoutList.append('<option value="">선택</option>');
						for(let i = 0; i < data.length; i++) {
							$layoutList.append('<option value="' + data[i].LAYOUT_NO + '">' + data[i].LAYOUT_NM + '</option>');
						}
					}
				}, Net_fail); 
			}
		</script>
	</head>
	<body>
		<h1>mgridstack</h1>
		<select id="layoutList">
			<option value="">선택</option>
		</select>
		<div class="grid-stack"></div>
		<div id="modal" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: none; background-color: rgba(0, 0, 0, 0.4);">modal</div>
	</body>
</html>
