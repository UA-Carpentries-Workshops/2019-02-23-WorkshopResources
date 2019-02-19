field="$1"
echo $field
shift
echo "$@"

for gapminderfile in "$@"
do
    echo $gapminderfile
    cut -f $field $gapminderfile | sort -n | head -1
done
