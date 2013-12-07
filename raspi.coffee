Cylon = require("cylon")
Arm = require('./arm')
arm = null

Roomba = require('./roomba')
roomba = new Roomba()

Camera = require('./camera')
camera = new Camera()


express = require("express")
app = express()
app.get "/", (req, res) ->
  res.send camera.getImage()


Cylon.robot(
  connection:
    name: "raspi"
    adaptor: "raspi"
    port: "/dev/ttyACM0"

  device:
    name: "servo"
    driver: "servo"
    pin: 11

  work: ( my ) ->
    my.servo.angle( 45 )
    app.listen 3000

).start()



