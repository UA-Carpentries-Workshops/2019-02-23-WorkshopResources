# Use all files specified as arguments ("$@")
for gapminderfile in "$@"
do
    echo $gapminderfile  # output the filename to the screen
    cut -f 5 $gapminderfile | sort -n | head -1  # sort the 5th column and output the lowest value
done
