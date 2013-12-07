exec = require("child_process").exec
sys = require("sys")
fs = require('fs')

class Camera
  takeImage: ->
    console.log( 'taking image' )
    exec "raspicamera -o image.jpg", ->
      console.log('image taken')
      console.log(arguments)

  getImage: ( cb )->
    cb = cb or ->
      return null

    fs.readFile( 'image.jpg', cb )