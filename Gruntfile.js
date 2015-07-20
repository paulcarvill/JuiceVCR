module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    env : {
      options : {
      },
      dev: {
        NODE_ENV : 'DEVELOPMENT'
      },
      prod : {
        NODE_ENV : 'PRODUCTION'
      }
    },

    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        files: {
          'public/juicevcr.min.js': [
            'dev/app/vendor/jquery.min.js',
            'dev/app/vendor/underscore-min.js',
            'dev/app/vendor/backbone-min.js',
            'dev/app/vendor/modernizr.min.js',
            'dev/app/vendor/video.js',
            'dev/app/models/video.js',
            'dev/app/models/playlist.js',
            'dev/app/views/**/*.js',
            'dev/app/*.js'
            ],
        }
      }
    },

    cssmin: {
      options: {
        shorthandCompacting: false,
        roundingPrecision: -1
      },
      target: {
        files: {
          'public/juicevcr.min.css': ['dev/app/assets/styles/styles.css', 'dev/app/assets/styles/video-js.css', 'dev/app/assets/styles/1507-YATADE.css']
        }
      }
    },

    processhtml: {
      options: {
        data: {
          message: 'Hello world!'
        }
	    },
		  dist: {
        files: {
				  'dist/index.html': ['dev/app/devindex.html']
        }
		  }
	   },

    copy: {
      main: {
        files: [
          {src: 'dist/index.html', dest: 'craft/templates/index.html'},
          {src: 'dev/app/assets/styles/AtlasGrotesk-Black-Web.eot', dest: 'public/AtlasGrotesk-Black-Web.eot'},
          {src: 'dev/app/assets/styles/AtlasGrotesk-Black-Web.svg', dest: 'public/AtlasGrotesk-Black-Web.svg'},
          {src: 'dev/app/assets/styles/AtlasGrotesk-Black-Web.ttf', dest: 'public/AtlasGrotesk-Black-Web.ttf'},
          {src: 'dev/app/assets/styles/AtlasGrotesk-Black-Web.woff', dest: 'public/AtlasGrotesk-Black-Web.woff'},
          {src: 'dev/app/assets/styles/AtlasTypewriter-Regular-Web.eot', dest: 'public/AtlasTypewriter-Regular-Web.eot'},
          {src: 'dev/app/assets/styles/AtlasTypewriter-Regular-Web.svg', dest: 'public/AtlasTypewriter-Regular-Web.svg'},
          {src: 'dev/app/assets/styles/AtlasTypewriter-Regular-Web.ttf', dest: 'public/AtlasTypewriter-Regular-Web.ttf'},
          {src: 'dev/app/assets/styles/AtlasTypewriter-Regular-Web.woff', dest: 'public/AtlasTypewriter-Regular-Web.woff'}
          ]
      }
    },

    'http-server': {
 
        dev: {
 
            // the server root directory 
            root: 'dev/app',
 
            // the server port 
            // can also be written as a function, e.g. 
            // port: function() { return 8282; } 
            port: 8000,
            
 
            // the host ip address 
            // If specified to, for example, "127.0.0.1" the server will  
            // only be available on that ip. 
            // Specify "0.0.0.0" to be available everywhere 
            host: "0.0.0.0",

            // server default file extension 
            ext: "html",
        }
    },

    preprocess : {
        prod: {
            src : './dev/app/index.html',
            dest : './dev/app/devindex.html'
        }
    },


    // TODO: copy images for prod
    // TODO: adjust css image paths for dev + prod
});

  grunt.loadNpmTasks('grunt-env');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-processhtml');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-http-server');
  grunt.loadNpmTasks('grunt-preprocess');

  // Default task(s).
  grunt.registerTask('dev', ['env:dev', 'preprocess', 'http-server']);
  //grunt.registerTask('default', ['uglify', 'cssmin', 'processhtml', 'copy']);
  grunt.registerTask('build', ['env:prod', 'preprocess', 'uglify', 'cssmin', 'processhtml', 'copy']);

};





