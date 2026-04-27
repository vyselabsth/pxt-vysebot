# Vyse S1 Robot for MakeCode

This extension contains **blocks for the Vyse S1 micro:bit robot** and **a web simulator**.
This library requires a **micro:bit V2** (V2 or V2.2). The micro:bit V1 is not supported.

> The library is still in beta and is subject to changes.

### Hardware requirements

The firmware is designed for the Vyse S1 chassis:

-   2 motors that can be forward, backward, left, right turns. Precise detection of distance is **not** needed.
-   2 line sensors
-   an ultrasonic distance sensor
-   RGB LEDs (headlights)
-   Programmable LED strip (undercarriage)

## Using this extension

-   Open https://makecode.microbit.org
-   Add this extension to your project by adding url [https://github.com/pwnept/pxt-vysebot](https://github.com/pwnept/pxt-vysebot)

## Tutorials

-   [Getting started](https://makecode.microbit.org/#tutorial:github:microsoft/microbit-robot/tutorials/getting-started)
-   [Light and Sound](https://makecode.microbit.org/#tutorial:github:microsoft/microbit-robot/tutorials/light-and-sound)
-   [Line follower](https://makecode.microbit.org/#tutorial:github:microsoft/microbit-robot/tutorials/line-follower)

## Simulator

The simulator will load automatically in MakeCode once you use a robot block.
It is designed to help programming this kind of robot.

-   The simulator supports the line sensors and obstacle detectors.
-   You can drag the robot using the mouse to reset the movements.
-   If you use radio, you will see a single simulator with multiple robots.
-   On a small screen, click on the **full screen icon** to show the simulator.
-   Remember that the simulation is not perfect. It does not capture all the subtle imperfections of the physical robot
    (motor wear, battery level, weight distribution, ground friction, ...).

## Blocks

### Understanding the screen

The extension uses the 5x5 screen to show the state of the robot (you can turn off this behavior see configuration).
This is particularly useful to debug your robot program.

-   left and right LED column show the line detector state
-   center column shows the obstacle distance in multiple of 5cm
-   2nd and 4th column show the motor throttle

### Choosing the robot type

At the start of any robot program, you need add the block to select the robot model you will be using.

> **This should be done before using any other blocks**.

```blocks
robot.vyseS1.start()
```

### Motors

There are two ways to control the motor: **tank** or **steer**.

#### Tank

The `tank` block takes the `left` and `right` motor
speed between `-100%` and `100%` and an optional `duration` in milliseconds.
The block will pause for the `duration` before continuing to the next block (it does _not_ stop
at the end of the duration).

```blocks
input.onButtonPressed(Button.A, () => {
    robot.motorTank(50, 50, 1000)
})
```

### ~hint

#### Hint Why can't we use angles?

The Vyse S1 does not have sensors to measure the rotation of the wheels,
so it is not possible to compute rotation angles or distances. The only known value
is that amount of power sent to the robot.

### ~

### Steer

The `steer` block takes a `steering` and `speed`parameters.
The`steering`controls how much "turn",`speed` controls the throttle on the motors.
The optional duration is in milliseconds.

```blocks
input.onButtonPressed(Button.A, () => {
    robot.motorSteer(0, 100, 1000)
})
```

### Stop

This block stops the robot.

```blocks
input.onButtonPressed(Button.B, () => {
    robot.motorStop()
})
```

### LEDS and music

-   set LED and headlights color

```blocks
input.onButtonPressed(Button.A, function () {
    robot.setColor(0xff0000)
})
```

-   play tone

```blocks
input.onButtonPressed(Button.A, function () {
    robot.playTone(262, music.beat(BeatFraction.Whole))
})
```

### Obstacle detection

-   detect when an obstacle is changing
    and read the current distance (in cm)

```blocks
let dist = 0
robot.onObstacleDistanceChanged(function () {
    dist = robot.obstacleDistance()
})
```

### Line detection

-   detect line changes or read line state

```blocks
let left = false
robot.onLineDetected(function () {
    left = robot.detectLine(RobotLineDetector.Left)
})
```

### Configuration

-   turn off robot screen

```blocks
robot.setAssist(RobotAssist.Display, false)
```

-   configure the motor drift

```blocks
robot.setMotorDrift(10)
```

-   disable or enable line assist

```blocks
robot.setAssist(RobotAssist.LineFollowing, false)
```

-   disable or speed smoothing assist

```blocks
robot.setAssist(RobotAssist.Speed, false)
```

## Usage with MicroCode

Use micro:code to remote control a robot using this library.

-   [Documentation](https://microsoft.github.io/microcode/docs/robot)

## Supported targets

-   for PXT/microbit

## License

MIT
