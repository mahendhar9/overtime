$(document).ready(function() {
	$.getScript("https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js").done(function(response, status) {
		WebFont.load({
			google: {
				families: ['Open Sans']
			}
		});
	});
});