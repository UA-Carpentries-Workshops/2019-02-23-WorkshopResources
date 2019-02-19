
for gapminderfile in [U-Z]*.txt
do
    echo $gapminderfile
    cut -f "$1" $gapminderfile | sort -n | head -1
done
