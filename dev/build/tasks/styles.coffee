module.exports = ->
  @loadNpmTasks "grunt-bbb-styles"

  # This task simplifies working with CSS inside Backbone Boilerplate projects.
  # Instead of manually specifying your stylesheets inside the HTML, you can
  # use `@imports` and this task will concatenate only those paths.
  @config "styles",

    # Out the concatenated contents of the following styles into the below
    # development file path.
    "public/styles.css":

      # Point this to where your `index.css` file is location.
      src: "dev/app/assets/styles/styles.css"

      # prefix: "dev/app/assets/styles/"

      # The relative path to use for the @imports.
      #paths: ["dev/app/styles"]

      # Rewrite image paths during release to be relative to the `img`
      # directory.
      forceRelative: "/app/img/"