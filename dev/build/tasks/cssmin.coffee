module.exports = ->
  @loadNpmTasks "grunt-contrib-cssmin"

  # Minify the distribution CSS.
  @config "cssmin",
    release:
      files:
        "public/styles.min.css": ["public/styles.css"]
