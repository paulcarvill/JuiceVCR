JuiceVCR.Views.ContactView = Backbone.View.extend({
	events: {
		"click a" : "doClick"
	},

	open: false,

	initialize: function(){
    	_.bindAll(this, 'keydown', 'doClick');
      $(window).on('keydown', this.keydown);
    },

    keydown: function(event) {
      if (event.keyCode == 27) { // escape
        if(this.open) {
        	this.doClick();
        }
      }
    },

	display: function(){
		this.open = this.open == true ? false : true;
		$(this.el).toggleClass('mesh');
		$('body').toggleClass('mobwoop');
	},

	doClick: function(){
		this.display();
		window.app.videoPlayer.userActive(true);
	}
})