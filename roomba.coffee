Roomba = require("../roomba.js").Roomba

class Roomba
  constructor: ->
    @bot = new Roomba(sp:
      path: "/dev/ttyAMA0"
      options:
        baudrate: 57600
    )
    @bot.once "ready", =>
      console.log "spinning up"
      @ready()
    @bot.on "sense", (sensors) =>
      @onSense.apply( @, arguments )
      

  ready: ->
    @isReady = true
    @forward()


  forward: ->
    if @isReady 
      @bot.send
        cmd: "DRIVE"
        data: [500, -1]

  reverse: ->
    if @isReady
      @bot.send
        cmd: "DRIVE"
        data: [0, -1]

  onSense: ( sensors )->
    if sensors.bump.right or sensors.bump.left
      console.log "bump detected"
      @reverse()
     


