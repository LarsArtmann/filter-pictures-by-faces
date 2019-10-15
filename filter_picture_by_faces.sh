URI=$1

echo Started picure filter by face on $URI 

NO_FACE_FILE="NO_FACE_RESULT.txt"
OUTPUT=$(gcloud ml vision detect-faces $URI)
NO_FACE=$(cat $NO_FACE_FILE)

DIR=$(dirname "${URI}")
BASE=$(basename "${URI}")

if [ "$NO_FACE" != "$OUTPUT" ]; then
	FILE="./face"
else
	FILE="./no_face"
fi

if [ ! -d $FILE/$DIR ]; then mkdir -p $FILE/$DIR; fi
exec cp -vu ./$URI $FILE/$URI
