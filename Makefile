oscad = /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
main = scad/main.scad
output_dir = stl/
rotor_source = scad/rotor.scad

all:$(output_dir)base.stl $(output_dir)lid.stl $(output_dir)latch.stl $(output_dir)rotor.stl

$(output_dir)rotor.stl: $(rotor_source)
	$(oscad) -o $@ $(rotor_source)

$(output_dir)base.stl: $(main)
	$(oscad) -o $@ -D draw_complete=0 -D draw_lid=0 -D draw_latch=0 -D draw_base=1 $(main)

$(output_dir)lid.stl: $(main)
	$(oscad) -o $@ -D draw_complete=0 -D draw_lid=1 -D draw_latch=0 -D draw_base=0 $(main)

$(output_dir)latch.stl: $(main)
	$(oscad) -o $@ -D draw_complete=0 -D draw_lid=0 -D draw_latch=1 -D draw_base=0 $(main)

clean:
	rm $(output_dir)*.stl
