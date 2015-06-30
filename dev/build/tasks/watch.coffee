module.exports = ->
  @loadNpmTasks "grunt-contrib-watch"

  @config "watch",

      options:
        livereload: true

      # Gruntfile
      grunt:
        files: [
          'Gruntfile.{coffee,js}'
        ]

      # Scripts
      scripts:
        files: ['dev/app/**/*.js']
        tasks: [
          'jshint',
          'requirejs'
        ]

      # Styles
      styles:
        files: [
          'dev/app/styles/**/*',
        ]
        tasks: [
          'styles',
          'cssmin'
        ]
      
      # Images
      # img_gif:
      #   files: ['<%= path.dev %>/assets/img/**/*.gif']
      #   tasks: ['newer:copy:gif']
      # img_jpg:
      #   files: ['<%= path.dev %>/assets/img/**/*.{jpg,jpeg}']
      #   tasks: ['newer:copy:jpg']
      # img_png:
      #   files: ['<%= path.dev %>/assets/img/**/*.png']
      #   tasks: ['newer:copy:png']
      # img_svg:
      #   files: ['<%= path.dev %>/assets/img/**/*.svg']
      #   tasks: ['newer:copy:svg']