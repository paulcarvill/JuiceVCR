JuiceVCR.Views.InfoButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(){
      if (!window.app.videoPlayer.videoIsFullscreen) {
        window.app.videoPlayer.requestFullscreen();
      } else {
        window.app.videoPlayer.exitFullScreen();
      }
    }
})