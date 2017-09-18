files="trap.scad side_panels.scad"
for file in $files ;
do
  for i in $(seq $minUnits $maxUnits);
  do
    openscad -o $output/$(basename "$file" .scad)-$i.$ext -D Handles=false -D Units=$i $file
  done
done
for i in $(seq $minUnits $maxUnits);
do
  openscad -o $output/extrusion-$i.$ext -D Center=true -D Front=false -D Side=false -D Units=$i extrusion.scad
  openscad -o $output/extrusion-front-$i.$ext -D Center=true -D Front=true -D Side=false -D Units=$i extrusion.scad
  openscad -o $output/extrusion-front-side-$i.$ext -D Center=true -D Front=true -D Side=true -D Units=$i extrusion.scad
done
openscad -o $output/side_panels-handle.$ext -D Handles=true -D Units=3 side_panels.scad

