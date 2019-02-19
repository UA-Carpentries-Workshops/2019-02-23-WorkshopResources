# Use first argument to select field to cut
# Use second argument to specify highest or lowest values
# Process all specified .txt files 
# (Remember that sort -n outputs lowest to highest numbers)

field="$1"
order="$2"
shift
shift
echo $field $order
echo "$@"

for gapminderfile in "$@"
do
    echo $gapminderfile  # print the filename on the screen
    if [ "$order" = "high" ]  
    then  # if "high" then show highest value (tail)
            cut -f "$field" $gapminderfile | sort -n | tail -1 >> gm_field"$field"_"$order".out
    else  # otherwise show lowest value (head)
            cut -f "$field" $gapminderfile | sort -n | head -1 >> gm_field"$field"_"$order".out
    fi
done

# Move the output file to the home directory
mv gm_field"$field"_"$order".out ~
