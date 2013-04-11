$(document).ready(function() {
	$("#Flash").flash({
        swf: "Flash26.swf",
		width: 980,
	    height: 800,
        wmode: "transparent",
        id:"flashmov"
	});
	$("#Content").hide();
	Pages.loadNews();
});

function getFlashMovie(movieName) {
  var isIE = navigator.appName.indexOf("Microsoft") != -1;
  return (isIE) ? window[movieName] : document[movieName];
}

var Videos = {
	open: function(id) {
		params = {
		    'padding'           : 0,
        	'autoScale'     	: false,
    	    'transitionIn'		: 'none',
			'transitionOut'		: 'none',
			'width'				: 710,
			'height'			: 406,
			'overlayColor'		: '#000',
			'overlayOpacity'	: 0.7,
			'type' : 'swf',
			'onClosed': Videos.close
		};
		Music.updateState();
		Music.mute();
		$("<a>",{href:"http://www.youtube.com/v/"+id+"?rel=0&autoplay=1"}).hide().appendTo($("body")).fancybox(params).trigger("click").remove();
	},
	close: function() {
		if (Music.lastState) Music.unMute();
	}
}

var Music = {
	lastState: true,
	updateState: function() {
		this.lastState = getFlashMovie("flashmov").getSound();
	},
	mute: function() {
		getFlashMovie("flashmov").mute();
	},
	unMute: function() {
		getFlashMovie("flashmov").unMute();
	}
}

var Pages = {
	last: 0,
	open: function(id) {
		if (this.last != 0) this.close();
		if (id == 0) {
			this.close();
			this.last = id;
			return;
		}
		getFlashMovie("flashmov").changePage(id);
		id = this.fp(id);
		this.load("Body",id);
		this.last = id;
	},
	opened: function(id) {
		if (this.last != 0) this.close();
		if (id == 0) {
			this.close();
			this.last = id;
			return;
		}
		id = this.fp(id);
		this.load("Body",id);
		this.last = id;
	},
	close: function() {
		this.closer();
		this.last = 0;
	},
	closer: function() {
		$("#Content").fadeOut("fast", function() {
			$("#Content").html("");
		});
	},
	load: function(part,id) {
		$.get("Load.asp",{Part:part,ItemID:id},Pages.loaded);
	},
	loaded: function(content) {
		timer = 1600;
		setTimeout(function(){Pages.opener(content)},timer);
	},
	opener: function(content) {
		$("#Content").html(content);
		$("#Content").fadeIn("fast",function() {
			$("#Content .Scroller").jScrollPane({ showArrows: true });
			$("#Content a").each(function () {
				var href=$(this).attr("href");
				if (href.indexOf("/images") != -1 && href.indexOf("javascript") != -1) $(this).fancybox();
			    //if (($(this).has('img').length || ($(this).attr("href").indexOf(".jpg")) != -1 || ($(this).attr("href").indexOf(".png")) != -1) && ($(this).attr("href").indexOf("javascript") == -1)) $(this).fancybox();
		    });
		});
	},
	fp: function(id) {
		switch (id) {
			case 1:
				return 2;
			case 2:
				return 4;
			case 3:
				return 3;
			case 4:
				return 5;
			default:
				return id;
		}
	},
	News: function() {
		params = {
		    'padding'           : 0,
        	'autoScale'     	: true,
			'overlayColor'		: '#000',
			'overlayOpacity'	: 0.7,
			'onComplete': function() {
				$("#News .Scroller").jScrollPane({ showArrows: true });
			}
		};
		$("<a>",{href:"#News"}).hide().appendTo($("body")).fancybox(params).trigger("click").remove();
	},
	loadNews: function() {
		$.get("Load.asp",{Part:"News"},function (content) {
			$("#News .Scroller").html(content);
			$("#News .Scroller").jScrollPane({ showArrows: true });
			$("#News a").each(function () {
			    if ($(this).has('img').length || ($(this).attr("href").indexOf(".jpg")) != -1 || ($(this).attr("href").indexOf(".png")) != -1) $(this).fancybox();
		    });
		});
	}
}