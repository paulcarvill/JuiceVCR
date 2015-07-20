JuiceVCR.Views.AboutView = Backbone.View.extend({

	events: {
		"click a" : "doClick"
	},

	display: function(){
		$(this.el).toggleClass('mesh');
		$('body').toggleClass('mobwoop');
	},

	doClick: function(){
		this.display();
		window.app.videoPlayer.userActive(true);
	}

})