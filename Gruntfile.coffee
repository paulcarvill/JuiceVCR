module.exports = ->

  # Load task configurations.
  @loadTasks "dev/build/tasks"

  # Run JSHint and a quick test.
  @registerTask "test", [
    "jshint"
    "karma:run"
  ]

  # ------------
  # Build tasks
  # ------------
  @registerTask "build", [
    "clean"
    "jshint"
    # "karma:run"
    "processhtml"
    "copy"
    "requirejs"
    "styles"
    "cssmin"
  ]

  # -------------------------------------------------------------------------- #
  # Listen tasks
  # -------------------------------------------------------------------------- #
  @registerTask "listen", [
    # Watch dev files for changes
    'watch'
  ]

  @registerTask "default", ['build', 'listen']
    # Watch dev files for changes
  return