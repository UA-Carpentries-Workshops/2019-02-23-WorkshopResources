#Runs script with first argument given in the command line
echo "$1"
head -n 5 "$1" | tail -n 2
