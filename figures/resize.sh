#!/bin/bash
maxWidth=1200
maxHeight=1200

# search for pictures and write paths to a files.out file
find ./ -name '*.jpg' -or -name '*.JPG' -or -name '*.jpeg' -or -name '*.JPEG' -or -name '*.png' -or -name '*.PNG' > files.out

# loop over the paths (lines in the files.out)
while read f; do
    echo "processing '$f'"
    
    ## get filename and extenson
    #extention="${f##*.}"
    #filename="${f%.*}"

    # process both
    #if [ "$imageWidth" -gt "$maxWidth" ] || [ "$imageHeight" -gt "$maxHeight" ]; then
        #convert -resize ''"$maxWidth"x"$maxHeight"'' "$f" "$filename"_resized."$extention"
    #fi
    
    # process width (this will hadle landscape pictures)
    imageWidth=$(identify -format "%w" "$f")
    if [ "$imageWidth" -gt "$maxWidth" ] ; then
        mogrify -resize ''"$maxWidth"x'' "$f"
    fi

    # process height (this will further hadle portrait pictures)
    imageHeight=$(identify -format "%h" "$f")
    if [ "$imageHeight" -gt "$maxHeight" ] ; then
        mogrify -resize ''x"$maxHeight"'' "$f"
    fi
done <files.out

# cleanup
rm files.out
