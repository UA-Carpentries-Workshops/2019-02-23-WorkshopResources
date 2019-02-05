for number in {1..20}
do
    if [ $number -lt 10 ]
    then
        echo "The $number is lower than ten"
    elif [ $number -eq 10 ]
    then
    	echo "The $number is equal to ten"
    else
        echo "The $number is higher than ten"
    fi
done