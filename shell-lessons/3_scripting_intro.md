# Lesson 3

## Intro to Shell Scripting

We're going to explore shell scripts in this session. First you'll need to navigate to your ~/SDC_02-23-2019/2019-02-23-WorkshopResources/repository directory and create a 'scripts' directory. But first, type into the Etherpad which key should you use to complete parts of the directory path as you're entering your `cd` command. (You don't really want to type every character in the path, do you?):

```bash
cd ~/SDC_02-23-2019/2019-02-23-WorkshopResources/repository
mkdir scripts
```

Now let's copy the scripts from the git repo(sitory) we cloned earlier and put the copies into the new directory:
```bash
cp -R ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/ scripts/
```

We'll be working more with the gapminder data in this session. We will first review some commands, then practice chaining commands together using what are called *pipes*. Then we'll explore writing scripts that contain loops to repeat sets of commands and pipes.

Move into the gapminder_by_country directory:

```bash
cd ~/SDC_02-23-2019/data/gapminder_data/gapminder_by_country
```

Run the command to list the files:

```bash
ls
```

What do you notice about the similarities and differences of the filenames? We'll use the word count `wc` command to list the number of lines in each file. Run the `wc -l *` command.

***Etherpad question***<br>
What do you see that's interesting? What command can we use to look at the contents of the file with the fewest number of lines?

```bash
cat country.cc.txt
```

Now we have an idea of what data these files contain. Let's look at a few examples.

***Etherpad question***<br>
Type a command that will show the contents of all of the .txt files with names starting with Z

```bash
cat Z*.txt
```

The `*` is a wildcard character that matches one or more occurrences of any character. If we want to look at what's in the files with names starting with Y or Z, we can run the command:

```bash
cat [YZ]*.txt
```
***Etherpad question***<br>
What do you think will be output by the following command:

```bash
cat [W-Z]*.txt
```

We're starting to see a powerful feature of the shell, which is called a '*character class*'. There are many more ways to do pattern matching with the shell, but they are beyond the scope of this class. Feel free to explore these on your own! One useful source is: https://wiki.bash-hackers.org/syntax/pattern

### Using pipes to work with data

Use the Up-arrow key to scroll back through your command history to find the command that showed the contents of the country.cc.txt file. Press the Enter/Return key to execute the command again.

If we want to examine life expectancies for different countries, which column of data (i.e. column number) would we be interested in?

We can use the `cut` command to extract a particular field or column of data from files with delimited columns. The -f option tells the number(s) of the columns or fields we want to extract. Try these commands:

```bash
cut -f 2 Zimbabwe.cc.txt
cut -f 5 Zimbabwe.cc.txt
cut -f 5,6 Zimbabwe.cc.txt
cut -f 3-5,6 Zimbabwe.cc.txt
```

***Etherpad question***<br>
Which of the above commands extracts the life expectancy column?

If we want to sort the numbers in that column after extracting them, we can use a `pipe` to send the output of the cut command into the sort command. The symbol used to create a pipe is the vertical bar `|` which is often found above the Return or Enter key.:

```bash
cut -f 5 Zimbabwe.cc.txt | sort -n
```

We use the -n option with sort to get a numeric sort from low to high values (by default sorting is alphabetical, and it's important to use the right type of sorting for a given type of data.) Let's extend our pipe so that after sorting, it displays only the top 2 lines of output:

```bash
cut -f 5 Zimbabwe.cc.txt | sort -n | head -2
```

You can chain together as many commands as you like using pipes. Each time the output of the command before the `|` is passed as input to the command following the `|`.

Using the `ls` command and the `wc` command, can you think of how to construct a pipe that would count the number of *.txt* files in a directory? Try this:

```bash
ls *.txt | wc
```
***Etherpad question***<br>
Show how you could modify one part of the pipeline above to show only the number of files in the current directory. Is it the `ls` portion or the `wc` portion of the pipe that needs to be changed?

# Revisiting grep

The `grep` command has an odd name. It's a shortcut for 'get regular expression and print'. (You don't need to remember that though.) The important thing to remember about grep is that it will search for strings or words in files, and show you which lines contain those strings or words. Let's try a couple of examples:

```bash
grep "2007" [W-Z]*.txt
```

```bash
grep "2007" [L-P]*.txt
```

***Etherpad question***<br>
Can you spot lines containing years other than 2007? Write the countries for which this occurred.

We can fix this problem by telling grep to search for 2007 with white space on either side of it. We specify the whitespace using the string "\b" (the "\" is a backslash character, often found on the key above Enter or Return.) Make sure you understand the difference between backslash and forward slash.

***Etherpad question***<br>
Write one use of the forward slash.
Now try out the backslash:

```bash
grep "\b2007\b" [L-P]*.txt
```

This example shows the need to be very careful when working with large data sets. You should think carefully about what could go wrong while processing your data, and run sanity checks to make sure your outputs are correct.

The `grep` command is often combined with `wc -l` to count the number of lines that contain a specified word or pattern. Run this pipe:

```bash
grep "\b2007\b" *.txt | wc -l
```

How many files have a line in them that contains data for the year 2007? Compare this number to the output of the pipe:

```bash
ls *.txt | wc -l
```

***Etherpad question***<br>
Explain why the numbers are not the same.

***FIVE MINUTES BREAK***

### Writing loops to iterate over a set of files

Another way to work with a collection of files is to write a `for loop`. Inside the loop you can list a number of commands, but you'll need to give keywords `do` and `done` to demarcate the start and end of the loop. Type these lines in your terminal (pay close attention to the symbols used):

```bash
for gapminderfile in [W-Z]*.txt
do
  echo $gapminderfile
done
```

Something to notice here is the loop variable, in this case *gapminderfile*. In the first line of the for loop we create this loop variable, and inside the loop we use the variable by preceding it with the `$` character. It's important to remember that distinction between definition of the loop variable, and references to it using the `$`. It's also good practice to give your variables names that suggest their purpose, so that others who may read your code (including yourself after months or years pass since you've written it) can more readily understand the code.

## Why use loops

So far we've used just a few files to practice our loop, but you can see that loops would work on hundreds or thousands of files just as easily. Any time you are manually doing a repetitive task, you should stop and think about whether you could use a loop to do the task more automatically and efficiently!

## Storing a loop in a file

While we can type and execute a loop using the command line, it is more effective (and visually pleasing) to use a text editor to create a file, called a 'script'. Let's start with the simple loop we've already looked at. You'll find it stored in the file `~/SDC_02-23-2019/2019-02-23-WorkshopResources/repository/scripts/loop_files.sh`.

***Activity***<br>
IMPORTANT: The loop_files.sh script will only run properly if it's executed in the directory containing the data files. Check your present working directory, and if you need to, use the cd command to go to the gapminder_by_country directory, then run loop_files.sh using:

```bash
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_files.sh
```
Or by using:

```bash
sh ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_files.sh
```
***Etherpad questions***<br>
a. What happened when you ran the script?<br>
b. Mention two things that you notice about the code in the script.<br>

Let's break down what is happening.

1. In this case, the code inside the *for loop* will run once for each filename that matches `[U-Z]*.txt`. For loops can also be given a numeric range to iterate over. (For example, `cat ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_intro.sh`. There are other types of loops that run until a certain condition is met. You'll find information on those at the end of this lesson, and we'll cover them if time permits. <br>
2. *gapminderfile* is the main variable in our loop. Each time the loop runs (called an iteration) the *gapminderfile* variable is reassigned to a new filename. <br>
3. During each iteration, we reassign the variable and perform a task/command inside the loop in association with this variable. The *beginning of the loop* is signaled by the command `do`.<br>
4. The *$* symbol indicates the name of the variable inside the loop. It should be the same name as the one used in the `for` line at the top of the loop. In other words, we call for the variable’s value by putting *$* in front of it. <br>
5. Finally, the command `done` signals the end of the loop.

For our first script, all we did is echo each filename. This is often a good first step, to make sure your script is working on the set of files you're expecting it to. Now, let's look at a more useful script.

***Activity***<br>
Find the `loop_cut.sh` file, use cat to examine it, and then execute it by running:<br>

```bash
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_cut.sh
```

a. What does this loop do?<br>
b. Do we see the lowest or highest values of life expectancy for each country?

***Etherpad question***<br>
Tell how you would modify loop_cut.sh so that we will see the lowest life expectancies output.

***Activity***<br>
Edit a copy of the script and make the change:

```bash
nano ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_cut_low.sh
```

Run the edited script and put up a sticky to indicate whether you got this to work or you need help.

## Passing command line argument to scripts

The `loop_cut.sh` script passes the option '-f 5' to the cut command, so we will always see output from the 5th field of the gapminder_by_country files. We will now see how to make the script more flexible, so that we can specify the number for the field of interest when we run the script. If you've ever heard to anyone refer to the practice of 'hard-coding', fixing '-f 5' in loop_cut.sh is an example of this, and it's not considered to be a good practice.

***Activity***<br>
Use the cat command to show the contents of the ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_cut_arg.sh script. The special variable "$1" refers to the first command line argument. To run the script, enter:

```bash
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_cut_arg.sh 6
```

We just saw that in a shell script "$1" refers to the first script argument (in this case the number of the field to cut.)
***Etherpad question***<br>
Show how you think you would reference a 2nd argument to the script.

## Conditionals

*Conditionals* allow us to control what happens in your script based on a condition. To construct
*conditionals* in shell scripts, we use `if` and `then` statements. The structure of an `if` condition is as follows:

**if CONDITION_IS_MET<br>
    then DO_SOMETHING<br>
fi**

When the condition required by the `if` statement is met, the command following the `then` clause inside the statement is executed. If the condition is not met, then the internal command will not be executed. As is the case of *loops*, we need to indicate the end of the conditional. Here we will use `fi` to signal the end of the conditional.

*Conditionals* can be more complex:

**if CONDITION_IS_MET<br>
	then DO_SOMETHING<br>
  else DO_SOMETHING_DIFFERENT<br>
fi**

Let's run a script that expects a 2nd argument telling whether to display high or low values, and uses a conditional to compare that argument to the string "high":

***Activity***<br>
Use `cat` to show the code in the `loop_conditional1.sh` script:

```bash
cat ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_conditional1.sh
```
***Etherpad question***<br>
List what you see that refers to the 2nd argument.

Remember that the first argument tells which field of data to cut, so examples of using the `loop_conditional1.sh` script are:

```bash
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_conditional1.sh 5 high
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_conditional1.sh 5 low
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_conditional1.sh 6 high
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_conditional1.sh 6 low
```

***Activity***<br>
Run the `loop_conditional1.sh` script on the command line as shown in the examples above and observe the output.

***FIVE MINUTES BREAK***

## Adding comments to your shell script

Adding comments to your script is essential to secure its future usability and sharing potential. Without comments, it can be difficult to recall the function of a given line of code or understand scripts shared with collaborators. Thus, it is customary to add comments that explain the
actions of certain parts of the script.

You can add comments to a script by using nano.

Comments are marked by the use of the `#` character (called 'pound' or 'hash' or 'sharp'). Comments represent something that a **HUMAN USER** can read and understand. The computer ignores lines of code preceded by the `#` character, whether they appear at the begining or the middle of the line.

The commented `loop_conditional1.sh` script looks as follows:

```bash
# Process all .txt files with names beginning with U-Z
# (Remember that sort -n outputs lowest to highest numbers)

for gapminderfile in [U-Z]*.txt
do
    echo $gapminderfile  # print the filename on the screen
    if [ "$2" = "high" ]  
    then  # if "high" then show highest value (tail)
            cut -f "$1" $gapminderfile | sort -n | tail -1
    else  # otherwise show lowest value (head)
            cut -f "$1" $gapminderfile | sort -n | head -1
    fi
done
```
Running the updated code will produce the same output as before. However, now our script is more easy to understand by other people as well as for our future selves!


## Using all script arguments at one time

So far our scripts that work on gapminder data files have only looked at files with names starting with U-Z. This was convenient while we were developing our understanding of concepts, because we didn't see outputs for all of the files each time we ran the scripts, but rather outputs for a small subset of files. Now we'll see a way to make a script even more general, and we'll be able to tell it specifically which files we want to process.

We've seen the "$1", "$2", etc. references to script arguments. Now we'll use "$@" to refer to the entire collection of arguments. Look at the `loop_files_args.sh` file:

```bash
cat ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_files_args/sh
```

The code is:
```bash
# Use all files specified as arguments ("$@")
for gapminderfile in "$@"
do
    echo $gapminderfile  # output the filename to the screen
    cut -f 5 $gapminderfile | sort -n | head -1  # sort the 5th column and output the lowest value
done
```

***Activity***<br>
Run this script as follows:
```bash
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_files_args.sh A*.txt
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_files_args.sh [I-K]*.txt
bash ~/SDC_02-23-2019/2019-02-23-WorkshopResources/shell-lessons/scripts/loop_files_args.sh [I-K,U]*.txt
```

***Etherpad question***<br>
Type the number of lines of output each run produced. Use your stickies to indicate whether you need help.

# More about shell arguments

You may have noticed that when using "$@", we did not use the positional arguments "$1", "$2", etc. Later on in this lesson we'll see a way to do that, if time permits (and if not, the notes are there for your future reference).

## Debugging scripts

Even if we are careful, it is possible to make mistakes while writing scripts. Running a script that contains an error (or bug) could result in an empty output or even worse, an incorrect result. In order to help find bugs in our script we can use the -x flag to run bash in debug mode. Running a script in debug mode prints out each command as it is run, which will help to locate errors. Try this:

 ```bash
bash -x loop_conditional1.sh 5 average
```

## Shell exercise

Now, we will create a shell script that works on the gapminder data set, outputs results to a file, and moves that file to our home directory.  We'll use the `loop_conditional1_commented.sh` script as a starting point, make a copy of it named `loop_shell_exercise.sh` and modify that.

Your script should be able to:<br>
a) Loop through the `[U-Z]*.txt` files in the gapminder data set.<br>
b) Print the names of those files to the command line/terminal (one filename per loop iteration).<br>
c) use the first script argument as the field to cut from the data
d) use the second script argument as the sorting order ("high" or "low")
e) Capture the output of the cut command to a file named `gm_field"$1"_"$2".out`
f) Move the output file to your home directory
g) Be sure to add comments to your script!

HINT: Since you are starting with a copy of `loop_conditional1_commented.sh` you only need to add items e, f, and g. You will want to pay attention to where spaces are needed and where they are not.

Possible solution:
```bash
# Process all .txt files with names beginning with U-Z
# (Remember that sort -n outputs lowest to highest numbers)

for gapminderfile in [U-Z]*.txt
do
    echo $gapminderfile  # print the filename on the screen
    if [ "$2" = "high" ]  
    then  # if "high" then show highest value (tail)
            cut -f "$1" $gapminderfile | sort -n | tail -1 >> gm_field"$1"_"$2".out
    else  # otherwise show lowest value (head)
            cut -f "$1" $gapminderfile | sort -n | head -1 >> gm_field"$1"_"$2".out
    fi
done

# Move the output file to the home directory
mv gm_field"$1"_"$2".out ~
```

### Optional more Advanced Material

## Exploring differences between files

Think back to our earlier example of running `grep` to find all lines in gapminder data files containing 2007, and the issue we uncovered if our pattern did not pad the "2007" string with white space. How could we dignose what's going on? Remember that we can use '>' to send the output of a command to a file. Run the following two commands:
```bash
cd ~/SDC_02-23-2019/2019-02-23-WorkshopResources/repository/data/original_data/gapminder_by_country
grep "2007" *.txt > Found2007
grep "\b2007\b" *.txt >Found2007b
```

***Etherpad question***<br>
Write a command that would show the sizes of both of the new files. The `diff` command will show us the differences between 2 files:

```bash
diff Found2007 Found2007b
```

## An Introduction to File permissions

We can see the permission string for a file by running `ls -l` and observing the first part of each line of output containing a string of 'r,w'x, or -' characters. These represent the permissions "read, write, execute, and none." Permissions can be changed with the `chmod` (change mode) command.

## Enabling executable capabilities to the script

We can allow everyone to execute our scripts by using the chmod command. This command can be used to change file system modes/permissions of files and directories. To enable execution of our loop_filenames.sh script we use:

```bash
chmod +x loop_filenames.sh
```

Another good use of the chmod command is to make a data directory non-writeable. For example, we might want to protect the original_data directory so that it cannot be changed. This command will remove write permission (recursively) for original_data:
```bash
cd ~/SDC_02-23-2019/2019-02-23-WorkshopResources/repository/data
chmod -R -w original_data
```

## Other loops

Another type of loop is the *while loop*. A *while loop* tests for a condition at the top of a loop,
and keeps looping as long as that condition is met. In contrast to the *for loop*, the *while
loop* is used in situations where the number of loop repetitions is not known beforehand.

An example of a *while loop* is a follow:

```bash
digit=1
while [ $digit -le 5 ]
do
  echo "Welcome guest number $digit"
  digit=$(( $digit + 1 ))
done
```

As in the case of the *for loop*, the `while` commands tells the computer that we are inside a loop. This type of loop is referred as a *while loop* an it also tells the computer that we want to execute a command multiple times.

Let's break down what is happening.

1. This loop will run 5 times. In this case, the loop will be executed until the meet the established condition: that our variable is lower or equal than 5. <br>
2. We define *digit* as a variable outside the loop, and then by using $digit we re-assign this variable on each loop iteration. -le is a *comparison operator* that we will use to make sure the variable is met<br>
3. During each iteration, we reassign the variable and perform a task/command inside the loop in association with this variable. The *inside of the loop* is signaled by the command `do`.<br>
4. The digit=$(( $digit + 1 )) portion of the loop adds one to the $digit variable.<br>
5. Finally, the command `done` signals the end of the loop.

Note that for comparisons between integers we need to use "a binary comparison operator".
These operators are used to compare two variables or quantities. I(Find more details about
different types of operators here: http://tldp.org/LDP/abs/html/comparison-ops.html)

Now, let's take a moment to examine other loops.

***Activity***<br>
Run the `while_loop.sh` file on the command line and observed the output. Once you are familiar with it, start modifying the loop by doing the following. Tell us what is happening on each case on the Etherpad:<br>
a. Change the digit variable from 1 to 3. <br>
b. Change the comparison operator from -le to -ne<br>
c. Eliminate the digit=$(( $digit + 1 )). Do this last!<br>


### Killing an infinite loop

Uh oh! We seem to have created an infinite loop by doing question "d". In the case of *while loops*, if the conditions to finish the loop
are never met the loop will continue running until the user kills the process. If you find your self in this
position don't panic! You can end and kill a rogue while loop by pressing the following command on your terminal:

```bash
Ctrl+C
```

## More about conditionals

Recall that the `loop_conditional1.sh` script compared an argument string with the string "high" to decide whether to output high or low values. What would happen if we ran this script and gave the 2nd argument as "average"? In the Etherpad, indicate whether you think the script would work as expected when given "average" as the 2nd argument.

We can make the script more robust by adding even more conditionals. Besides using the *if/then/else* comparison we can capture an alternative
condition by using `elif`:

**if CONDITION_1_IS_MET<br>
	then DO_SOMETHING<br>
  elif CONDITION_2_IS_MET<br>
        then DO_SOMETHING_DIFFERENT<br>
  else DO_SOMETHING_YET_AGAIN_DIFFERENT<br>
fi**

Look at the `loop_conditional2.sh` script and try running it. In the Etherpad, comment on why this version of the script is more robust.

## Using positional arguments and "$@"

On occasion you may wish to write a script that work with some number of positional arguments, then use "$@" as a list of arguments. This can be done by assigning the positional arguments to variables in the script, then using the shell built-in command *shift* to shift them off of the list of arguments. See `loop_comboargs.sh` for an example:

```bash
echo "$@"
field="$1"
echo $field
shift
echo "$@"

for gapminderfile in "$@"
do
    echo $gapminderfile
    cut -f $field $gapminderfile | sort -n | head -1
done
```

After assigning "$1" to the variable named 'field', we do a shift to move all of the positional arguments down by 1. Now when we echo "$@" the second time we can see that the original "$1" has been replaced by the original "2", and so forth.

## Final shell loop_final_exercise

Using what you just learned about `shift`, make a copy the `loop_shell_exercise.sh` script and modify it to store and then shift "$1" and "$2" so that your loop can run on a list of files specified to the script after "$1" and "$2".

Possible solution:
```bash
# Use first argument to select field to cut
# Use second argument to specify highest or lowest values
# Process all specified .txt files
# (Remember that sort -n outputs lowest to highest numbers)

field="$1"
order="$2"
shift
shift
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
```

### Wrap up

Hopefully you've learned a lot of useful tools today. As you keep practicing and developing your skills, it will get easier and you'll find many, many more commands and techniques that will make you a more efficient scientist!
