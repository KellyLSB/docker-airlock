module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    mashbash:
      options:
        buildDir: 'dist'
      dist:
        files:
          'airlock.bash': 'source/airlock.mash'

  # Load in tasks from packages
  grunt.loadNpmTasks 'mashbash'

  # Default Task
  grunt.registerTask 'default', ['mashbash']

  # Build Task
  grunt.registerTask 'build', ['mashbash']
