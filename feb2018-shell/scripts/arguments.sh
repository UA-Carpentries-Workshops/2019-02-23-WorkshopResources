#Runs script with first, second, and third arguments given in the command line
echo "$1"
head -n "$2" "$1" | tail -n "$3"
