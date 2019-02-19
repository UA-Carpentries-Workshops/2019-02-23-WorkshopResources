for gapminderfile in [U-Z]*.txt
do
    echo $gapminderfile
    if [ "$2" = "high" ]
        then
            cut -f "$1" $gapminderfile | sort -n | tail -1
    elif [ "$2" = "low" ]
        then
            cut -f "$1" $gapminderfile | sort -n | head -1
    else
       echo "Unrecognized sorting option $2, should be 'high' or 'low'"
    fi
done
