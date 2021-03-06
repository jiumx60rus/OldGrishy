module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    # coffee
    coffee:
      compile:
        files:
          "ready/js/coffee.js": "src/coffee/main.coffee"
    
    # jade
    jade:
      compile:
        files:
          "dest/index.html": "src/jade/index.jade"
          "dest/page.html": "src/jade/page.jade"

    # stylus
    stylus:
      compile:
        files:
          "ready/css/stylus.css": "src/stylus/main.styl"

    # concat
    concat:
      css:
        src: "ready/css/*.css"
        dest: "dest/assets/style.css"

      js:
        src: "ready/js/*.js"
        dest: "dest/assets/main.js"

    # connect
    connect:
      server:
        options:
          port: 3000
          base: "dest"

    # watch
    watch:
      livereload:
        options:
          livereload: on
        files: ["dest/**/*"]
      js:
        files: ["ready/js/**/*.js"]
        tasks: ["concat:js"]
      css:
        files: ["ready/css/**/*.css"]
        tasks: ["concat:css"]
      jade:
        files: ["src/jade/**/*.jade"]
        tasks: ["jade"]
      stylus:
        files: ["src/stylus/**/*.styl"]
        tasks: ["stylus"]
      coffee:
        files: ["src/coffee/**/*.coffee"]
        tasks: ["coffee"]


  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"

  grunt.registerTask "default", [
    "coffee"
    "jade"
    "stylus"
    "concat:css"
    "concat:js"
    "connect"
    "watch"
  ]