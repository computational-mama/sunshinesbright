const dither_icons = document.querySelectorAll('.dither-toggle');
dither_icons.forEach(icon => {
	icon.addEventListener('click', function() {
	    let figure = icon.closest('.figure-controls').previousElementSibling;
	    let img = figure.querySelector('img');

	    if( figure.getAttribute('data-imgstate') == "dither"){
	    	figure.setAttribute('data-imgstate', 'undither');	    	
	    	let original = img.getAttribute('data-original');
	    	img.src = original;
	    }else{
	    	figure.setAttribute('data-imgstate', 'dither');
	    	let dither= img.getAttribute('data-dither');
	    	img.src = dither;
	    }    
	});
});