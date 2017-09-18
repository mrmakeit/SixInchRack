export maxUnits=10
export minUnits=1
export output=thumbnails
export ext=png
bash make_parts.sh
export output=models
export ext=stl
bash make_parts.sh
