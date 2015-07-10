JuiceVCR.Views.PrevButtonView = Backbone.View.extend({
	events: {
      "click": "doclick"
    },

    doclick: function(){
      window.app.skipVidBack();
    }
})