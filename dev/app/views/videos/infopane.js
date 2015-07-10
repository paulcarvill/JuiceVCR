JuiceVCR.Views.InfoView = Backbone.View.extend({

	initialize: function(){
		this.render();
		this.listenTo(this.model, 'change', this.render);
	},

	render: function(){
		var template = _.template($('#video-info-template').html());
		this.$el.html( template(this.model) );
	}
})