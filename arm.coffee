module.exports = class Arm
  constructor: ( servo )->
    @servo = servo

  lookUp: ->
    @servo.angle( 45 )