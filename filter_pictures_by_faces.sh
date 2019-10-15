FOLDER=$1

if [ ! -d "${FOLDER}" ]; then
    echo "$FOLDER is not a directory";
else
	for filename in $FOLDER/*.jpg; do
		[ -e "$filename" ] || continue
		echo Start on: $filename
		./filter_picture_by_faces.sh $filename
	done
fi


