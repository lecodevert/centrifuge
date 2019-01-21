UNAME := $(shell uname)

ifeq ($(UNAME),Darwin)
	oscad = /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
else
	oscad = /usr/bin/openscad
endif
main = scad/main.scad
config = scad/config.scad
output_dir = stl/

all:$(output_dir)base_universal.stl $(output_dir)base_small_motor.stl $(output_dir)lid_window.stl $(output_dir)lid_no_window.stl $(output_dir)latch.stl $(output_dir)rotor.stl $(output_dir)motor_spacer.stl build

$(output_dir)rotor.stl: $(config) $(main) scad/rotor.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_rotor=1 $(main)

$(output_dir)base_universal.stl: $(config) $(main) scad/base.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_base_universal=1 $(main)

$(output_dir)base_small_motor.stl: $(config) $(main) scad/base.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_base_small_motor=1 $(main)

$(output_dir)latch.stl: $(config) $(main) scad/latch.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_latch=1 $(main)

$(output_dir)lid_window.stl: $(config) $(main) scad/lid.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_lid_window=1 $(main)

$(output_dir)lid_no_window.stl: $(config) $(main) scad/lid.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_lid_no_window=1 $(main)

$(output_dir)motor_spacer.stl: $(config) $(main) scad/motor_spacer.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_motor_spacer=1 $(main)

dxf/window.dxf: $(config) $(main) scad/window.scad
	$(oscad) -o $@ -D draw_complete=0 -D draw_window=1 $(main)

build:
	pio run

clean:
	pio clean
	rm $(output_dir)*.stl
	rm dxf/*.dxf
