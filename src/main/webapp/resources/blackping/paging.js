pagingView = (paging, type) => {
	console.log(paging);
	
	getNet('GET', '/rest/selectList', paging, true, (data) => {
		console.log(data);
		if(data.status.response != 200) {
			alert('[' + data.status.error.errorCode + '] ' + data.status.error.errorMsg + '\n' + data.status.error.errorComment);
			return;
		}
		
		const thead = $('#board thead');
		const tbody = $('#board tbody');
		
		thead.empty();
		tbody.empty();
		
		let thead_html = '<tr><th>NO</th><th>TITLE</th></tr>';
		let tbody_html = '';
		for(let i = 0; i < data.row.result.length; i++) {
			tbody_html += '<tr>';
			tbody_html += `<td>${data.row.result[i].NO}</td>`;
			tbody_html += `<td>${data.row.result[i].TITLE}</td>`;
			tbody_html += '</tr>';
		}
		
		thead.append(thead_html);
		tbody.append(tbody_html);
		
		const board_page = $('#board_page');
		board_page.empty();
		const page = data.count.result.cnt / paging.page_count;
		let board_page_html = '';

		// 최저
		let page_start;
		page_start = paging.page_index - 5;
		if(page_start < 0) page_start = 0;
		// 최대
		let page_end;
		page_end = paging.page_index + 5;
		if(page_end > page)  {
			page_end = page;
		}
		for(let i = page_start; i < page_end; i++) {
			if(i === paging.page_index)
				board_page_html += `<span class="paging pointer pagingSelect">${i + 1}</span>`;
			else
				board_page_html += `<span class="paging pointer">${i + 1}</span>`;
		}
		board_page.append(board_page_html);
		
		$('#board_page span').off().on('click', (e) => {
			const value = Number($(e.target).html()) - 1;
			
			if(isNaN(value)) {
				alert('변조 감지');
				return;
			}
			
			const click_paging = {page_index: value, page_count: paging.page_count};
			pagingView(click_paging, 0);
		})
	}, Net_fail)
	
}