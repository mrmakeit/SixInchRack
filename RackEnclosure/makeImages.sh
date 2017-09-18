maxUnits=10
minUnits=1
files="trap.scad side_panels.scad"
for file in $files ;
do
  for i in $(seq $minUnits $maxUnits);
  do
    openscad -o thumbnails/$(basename "$file" .scad)-$i.png -D Handles=false -D Units=$i $file
  done
done
for i in $(seq $minUnits $maxUnits);
do
  openscad -o thumbnails/extrusion-$i.png -D Center=true -D Front=false -D Side=false -D Units=$i extrusion.scad
  openscad -o thumbnails/extrusion-front-$i.png -D Center=true -D Front=true -D Side=false -D Units=$i extrusion.scad
  openscad -o thumbnails/extrusion-front-side-$i.png -D Center=true -D Front=true -D Side=true -D Units=$i extrusion.scad
done
openscad -o thumbnails/side_panels-handle.png -D Handles=true -D Units=3 side_panels.scad

