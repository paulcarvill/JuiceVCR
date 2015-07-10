JuiceVCR.Views.ContactButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(){
      window.contact.display();
      window.app.videoPlayer.userActive(false);
    }
})