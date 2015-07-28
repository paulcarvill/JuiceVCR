JuiceVCR.Views.AppView = Backbone.View.extend({

	currentVideoIndex: 1,
	currentRecentVideoIndex: 0,

	initialize: function(){
		_.bindAll(this, 'playVid', 'skipVid', 'progressUpdate');

		for(var i = 0; i < JuiceVCR.data.length; i++){
			window.playlist.create(JuiceVCR.data[i]);
		}
		if(window.JuiceVCR.data.length) {
			for(var i = 0; i < JuiceVCR.recentData.length; i++){
				window.recentPlaylist.create(JuiceVCR.recentData[i]);
			}
		}
		this.playVid();
	},

	playVid: function(){
		this.vid = window.playlist.at(this.currentVideoIndex);

		this.videoPlayer = videojs('vid1', {
			type: this.vid.get('videotype'),
			src: this.vid.get('videourl'),
			techOrder: ["youtube", "vimeo"],
			autoplay: true,
			inactivityTimeout: 3000,
			controls: false,
			children: {
    			controlBar: false,
    			posterImage: false,
    			bigPlayButton: false,
    			loadingSpinner: false,
    			textTrackDisplay: false,
    			errorDisplay: false,
    			captionSettings: false
    		}
		});

		this.infopane = new JuiceVCR.Views.InfoView( { el : $('#info'), model: this.vid.toJSON() });

		this.videoPlayer.on('useractive', this.useractive);
		this.videoPlayer.on('userinactive', this.userinactive);
		this.videoPlayer.on('ended', this.skipVid);
		this.videoPlayer.on('timeupdate', this.progressUpdate);
	},

	progressUpdate: function(e){
		var percentage = Math.floor((100 / this.videoPlayer.duration()) * this.videoPlayer.currentTime());
		$('#progress').css('top', percentage + '%')
	},

	skipVid: function(){
		// if short list, just play all the videos in random order
		if(window.JuiceVCR.data.length < 30) {
			this.currentVideoIndex += 1;
			if(this.currentVideoIndex >= window.playlist.length){
				this.currentVideoIndex = 0;
			}
			this.vid = window.playlist.at(this.currentVideoIndex);
		}
		else {
			// check if it's time to play a recent video (eveyr 4th video)
			if (this.currentVideoIndex > 0 && this.currentVideoIndex % 4 === 0) {

				this.vid = window.recentPlaylist.at(this.currentRecentVideoIndex);

				//update current recent video index for next time
				this.currentRecentVideoIndex += 1;
				if(this.currentRecentVideoIndex >= 9){
					this.currentRecentVideoIndex = 0;
				}
				this.currentVideoIndex += 1;
				if(this.currentVideoIndex >= window.playlist.length){
					this.currentVideoIndex = 0;
				}
			} else {
				this.vid = window.playlist.at(this.currentVideoIndex);
				this.currentVideoIndex += 1;
				if(this.currentVideoIndex >= window.playlist.length){
					this.currentVideoIndex = 0;
				}
			}
		}


		this.videoPlayer.src({
			type: this.vid.get('videotype'),
			src: this.vid.get('videourl')
		});
		
		this.infopane = new JuiceVCR.Views.InfoView( { el : $('#info'), model: this.vid.toJSON() });
	},

	useractive: function(){
		$('body').removeClass('woop');
	},

	userinactive: function() {
		$('body').addClass('woop');
	}

})