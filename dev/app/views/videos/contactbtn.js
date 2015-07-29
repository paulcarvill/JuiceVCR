JuiceVCR.Views.ContactButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(e){
      e.preventDefault();
      window.contact.display();
      window.app.videoPlayer.userActive(false);
    }
})