JuiceVCR.Views.PlayButtonView = Backbone.View.extend({
    events: {
      "click": "doclick"
    },

    initialize: function(){
      _.bindAll(this, 'keydown', 'doclick');
      $(window).on('keydown', this.keydown);
    },

    playing: true,

    keydown: function(event) {
      if (event.keyCode == 32) { // space bar
        this.doclick();
      }
    },

    doclick: function(){
      if(this.playing){
      	this.playing = false;

        // hide play button
        $('#play', this.$el).toggle();

        // show pause button
        $('#pause', this.$el).toggle();

      	window.app.videoPlayer.pause();
        window.app.useractive();

      } else {
      	this.playing = true;

        // hide play button
        $('#play', this.$el).toggle();

        // show pause button
        $('#pause', this.$el).toggle();
        
      	window.app.videoPlayer.play();
        window.app.userinactive();
      }
    }
})