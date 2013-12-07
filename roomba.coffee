robot = require("create-oi");

class Roomba
  speed: 100
  constructor: ->
    robot.init({ serialport: "/dev/ttyUSB0" })
    robot.on "ready", =>  
      @ready()

    robot.on "bump", (bumpEvent) =>
      @onBump.apply( @, arguments )      

  ready: ->
    @isReady = true
    @forward()

  stop: ->
    if @isReady
      robot.drive( 0, 0 )

  forward: ->
    if @isReady 
      robot.drive( @speed, 0);

  reverse: ->
    
  onBump: ( sensors )->
    @stop()
     


