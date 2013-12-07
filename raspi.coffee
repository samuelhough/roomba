Cylon = require("cylon")
Arm = require('./arm')
arm = null

Roomba = require('./roomba')
roomba = new Roomba()

Camera = require('./camera')
camera = new Camera()

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
    arm = new Arm( my.servo )

).start()