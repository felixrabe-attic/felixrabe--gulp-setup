coffee = require 'gulp-coffee'
gulp = require 'gulp'
gutil = require 'gulp-util'
rimraf = require 'rimraf'

handleError = (err) ->
  gutil.log err
  @emit 'end'

gulp.task 'clean', (done) ->
  rimraf './lib', done

gulp.task 'build', ['clean'], ->
  gulp.src './lib-src/**/*.coffee'
    .pipe coffee(bare: true).on 'error', handleError
    .pipe gulp.dest './lib'

gulp.task 'watch', ->
  gulp.watch './lib-src/**/*.coffee', ['build']

gulp.task 'default', ['watch', 'build']
