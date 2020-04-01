function Net_fail() {
    alert('서버 오류');
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