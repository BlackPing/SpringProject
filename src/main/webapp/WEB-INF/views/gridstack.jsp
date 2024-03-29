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
			var grid;
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
				grid = GridStack.init(gridOption);
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
//				grid.movable(grid.getColumn(1), false);
				grid.load(items);
				
				document.getElementById('addBtn').addEventListener('click', (e) => {
					console.log('click');
					grid.addWidget({w: 1, h: 1, content: 'hello'});
				})
				
				document.getElementById('layoutAdd').addEventListener('click', (e) => {
					if($('#layoutNm').val() == '') {
						alert('레이아웃명이 비었습니다.');
						return;
					}
					
					if(confirm("레이아웃을 추가합니다")) {
						getNet('POST', '/rest/insertLayout', {layoutNm: $('#layoutNm').val()}, true, (data) => {
							console.log(data);
							if(data.status.response != 200) {
								alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
								return;
							} else {
								alert('레이아웃 추가 완료');
								selectLayoutList();
							}
						}, Net_fail); 
					}
				})
				/* grid.movable(grid.getGridItems()[0], false);
				grid.resizable(grid.getGridItems()[0], false); */
				
				/* getNet('GET', '/rest/selectLayout', {}, true, (data) => {
					console.log(data);
					if(data.status.response != 200) {
						alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
						return;
					}
				}, Net_fail); */
				
				var layoutNo;
				var layoutContent;
				var positionX;
				var postiionY;
				var postiionW;
				var postiionH;
				var layoutDatatype;
				
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
								data[i].content = '<div style="width: 100%; height: 100%; background-color: white; position: absolute;top: 0; left: 0; z-index: 1; opacity: 0.1;"></div><iframe style="width: 100%; height: 100%; border: 0; position: absolute; top: 0; left: 0;" src="' + data[i].LAYOUT_CONTENT + '"></iframe>';
							}
							grid.load(data);
						}
					}, Net_fail);
				});
				
/* 				var resizeContent;
				grid.on('resizestart', function(e, target) {
					let node = target.gridstackNode;
					resizeContent = node;
					
					grid.update(target, {x: node.x, y: node.y, w: node.w, h: node.h, content: 'TEST'})
					console.log("resizestart", e);
					console.log(target.gridstackNode);
				});
				
				grid.on('resizestop', function(e, target) {
					grid.update(target, resizeContent)
				}); */
				
				$('#layoutUpdate').on("click", function() {
					console.log('click');
					
					var item = [];
					var node = {};
					
					var gridItem = grid.getGridItems();
					for(let i = 0; i < gridItem.length; i++) {
						node.layoutContent = 'http://test-ping.co.kr:8080/page1'
						node.positionX = gridItem[i].gridstackNode.x
						node.positionY = gridItem[i].gridstackNode.y
						node.positionW = gridItem[i].gridstackNode.w
						node.positionH = gridItem[i].gridstackNode.h
						node.layoutDatatype = 'URL'
						item[i] = node;
						node = {};
					}
					
					getNet('POST', '/rest/updateLayoutContent', {layoutNo: $('#layoutList').val(), item: JSON.stringify(item)}, true, (data) => {
						if(data.status.response != 200) {
							alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
							return;
						} else {
							console.log(data);
							alert('저장완료!');
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
		<h1>gridstack</h1>
		<input id="layoutNm" type="text" placeholder="레이아웃 명" /><button id="layoutAdd">레이아웃 추가</button><button id="layoutUpdate">레이아웃 저장</button>
		<select id="layoutList">
			<option value="">선택</option>
		</select>
		<button id="addBtn">항목 추가</button>
		<div class="grid-stack"></div>
	</body>
</html>
