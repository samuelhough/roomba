exec = require("child_process").exec
sys = require("sys")
fs = require('fs')

module.exports = class Camera
  constructor: ->
    setInterval( =>
      @takeImage()
    , 5000)

  takeImage: ->
    console.log( 'taking image' )
    exec "raspistill -o image.jpg", ->
      console.log('image taken')
      console.log(arguments)

  getImage: ( cb )->
    cb = cb or ->
      return null

    fs.readFile( 'image.jpg', cb )