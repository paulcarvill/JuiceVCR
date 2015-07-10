JuiceVCR.Views.PlayButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    playing: true,

    doclick: function(){
      if(this.playing){
      	this.playing = false;

        // hide play button
        $('#play', this.$el).toggle();

        // show pause button
        $('#pause', this.$el).toggle();

      	window.app.videoPlayer.pause();
        $('.woop').removeClass('woop');

      } else {
      	this.playing = true;

        // hide play button
        $('#play', this.$el).toggle();

        // show pause button
        $('#pause', this.$el).toggle();
        
      	window.app.videoPlayer.play();
      }
    }
})