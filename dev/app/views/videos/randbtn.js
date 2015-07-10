JuiceVCR.Views.RandomButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(){
      window.app.playRandom();
    }
})