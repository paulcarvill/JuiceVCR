JuiceVCR.Views.NextButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    initialize: function(){
    	_.bindAll(this, 'keydown', 'doclick');
      $(window).on('keydown', this.keydown);
    },

    keydown: function(event) {
      if (event.keyCode == 39) { // right arrow
        this.doclick();
      }
    },

    doclick: function(){
      window.app.skipVid();
      // TODO: change text of play/pauyse button to 'play' because we always play when you skip to another track
    }
})