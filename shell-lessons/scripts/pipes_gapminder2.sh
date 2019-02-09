for filename in U*.txt
do
    echo $filename
    head -n 2 $filename >> output_test.txt
done