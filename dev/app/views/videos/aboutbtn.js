JuiceVCR.Views.AboutButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(){
      window.about.display();
      window.app.videoPlayer.userActive(false);
    }
})