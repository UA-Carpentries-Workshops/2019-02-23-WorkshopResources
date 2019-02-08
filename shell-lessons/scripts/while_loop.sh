digit=1
while [ $digit -le 5 ]
do
  echo "Welcome guest number $digit"
  digit=$(( $digit + 1 ))
done