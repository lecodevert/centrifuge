# F.Lab's DIYbio Centrifuge

![demo](doc/4RVZx7.gif)

This a remix of [F.Lab's DIYbio Centrifuge](https://www.thingiverse.com/thing:1175393) with the following changes:

  * Uses a [Digispark](http://digistump.com/products/1) (or clone) ATTiny85 board instead of an Arduino
  * The STL files were repaired as they were made from Sketchup and were not usable with Slic3r

## Bill of Materials

 * 12V 3A power supply with barrel jack with 5x5/2.1mm barrel jack connector
 * female 5.5/2.1mm barrel jack connector with screw terminals
 * 12V SPST 10*15mm switch
 * B10k 10k Ohm Adjustment Single Linear Rotary Potentiometer
 * Digispark ATTINY85
 * MT1806 2400KV CW/CCW Motor 1806 Mini Brushless Motor
 * BLHeli OPTO mini-16A ESC
 * 3mm screws

## Usage

First, install [PlatformIO](http://platformio.org) on your platform of choice.

Run in the root directory of this project:

    pio run

And plug in the Digispark when it tells you to. Upload takes a couple of seconds.

Make sure no components are connected while uploading to the Digispark. Do the upload before soldering.

## Schematic

![Schematic](doc/schematic.png)

## Original instructions

[Instructables](http://www.instructables.com/id/3D-Printed-DIYbio-Mini-Centrifuge/)

## Attribution

The included STL files and the whole project were originally created by [F.Lab](https://www.facebook.com/FLabDIYbioThailand/).
