for filename in U*.txt
do
    echo $filename
    head -n 5 $filename | tail -n 3
done