JuiceVCR.Views.AboutButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(e){
      e.preventDefault();
      window.about.display();
      window.app.videoPlayer.userActive(false);
    }
})