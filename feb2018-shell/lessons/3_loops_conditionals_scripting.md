# Lesson 3

## The shell script

We are going to use `nano` to examine, modify and alter some small scripts. By saving our commands on a script, we can re-run all them later by typing a single command. A file containing a series of commands is called a shell script. Shell scripts are identified by the ".sh" extension. 

You can modify the file using nano by typing:

```bash
nano [FILENAME].sh
```  

Or you can run the file by typing:

```bash
bash [FILENAME].sh
```
or

```bash
sh [FILENAME].sh
```

### Enabling executable capabilities to the script

We can allow everyone to execute our scripts by using the chmod command (change mode) is the command line. This command can be used to change file system modes/permissions of files and directories. Each shell script must have the execute permission. To enable executables in our scripts we use:

```bash
chmod +x script.sh
```

## Why use loops

Let's start with an question. What would you do if you wanted to check the number of words in a file using the command line?

```bash
wc [filename]
```
What would you do if you wanted to check this number of words in 5 files? What about 500 files? Would you type the same command 500 times just changing the name of the file?

In cases like this, we want to use a loop. A loop is a way of using programming to avoid having to type the same commands over and over again. Loops save time and make you more efficient! In other words, they are a way of automating a task, whatever it might be. For instance we might like to automate a task for:<br>

a) Modifying the names of a series of files<br>
b) Capturing a certain value across all genes in a genome<br>
c) Converting a given temperature across scales for multiple locations.<br>

***Etherpad question***<br> 
What other examples come to mind?

In a way, we have become familiar with the idea of using the command line to move, copy, observe, etc. several files at the same time. For instance:

***Etherpad question***<br>
Write the command that you would use to find the first two lines in all files with a .txt extension for the gapminder_by_country folder?<br>
Navigate to that folder using `cd` if you find yourself out of it.

***Solution:*** 
```bash
head -n 2 *.txt
```

## Structure of a loop

While we can type and execute a loop using the command line, it is more effective (and visualy pleasing) to use a text editor. Let's begin by examining the structure of a loop, as well as reviewing some concepts from the past lessons.

***Activity***<br>
Find the `loop_intro.sh` file in your own computer. Remember to run the file using the following:

```bash
sh loop_intro.sh
```
Or by using:

```bash
bash loop_intro.sh
```

Answer the following questions on the etherpad:<br>
a. What happened?<br>
b. Mention two things that you notice on the loop.<br>
c. What does the `echo` command do?

The `for` commands tells the computer that we are inside a loop. There are different types of loops, those that begin by using the `for` command are known as *for loops*. From now on, I will be using this term. The *for loop* tells the computer that we want to execute a command multiple times.

Let's break down what is happening.

1. In this case, the *for loop* will run 20 time. In other words, the loop will be executed the number of times we instruct it to. There are other types of loops that run until a certain condition is met. We will go over them in a bit more detail later. <br>
2. *number* is the main variable in our loop. Each time the loop runs (called an iteration) the *number* variable is reassigned to a new digit. <br>
3. During each iteration, we reassign the variable and perform a task/command inside the loop in association with this variable. The *inside of the loop* is signaled by the command `do`.<br>
4. The *$* symbol indicates the name of the variable inside the loop. It should be the same name as the one used outside the loop. In other words, we call for the variable’s value by putting *$* in front of it. <br>
5. Finally, the command `done` signals the end of the loop.

Now, let's take a moment to examine other loops. 

***Activity***<br>
Find the `loop_structure.sh` file and execute it by running:<br>

```bash
sh ~/Desktop/loop_structure.sh
```
Note that you might need to modify the path to the file based on the file strcuture you have created.

a. What does this loop do?<br>
b. Why do we need to change the path to the `loop_structure.sh` file?<br>

***Activity***<br>
Take a moment to modify this or the previous file. Test and evaluate different possibilities by changing different elements of the loop. Report any questions or interesting finding onto the etherpad.
  
## Piping and saving to a file after using a loop

As you might have figured out, loops are pretty versatile! Using the proper structure, you can even pipe commands within a loop!

***Activity***<br>
Navigate to your gapminder_by_country folder and execute the `pipes_gapminder1.sh` and `pipes_gapminder2.sh` files by running:<br>

```bash
sh ~/Desktop/pipes_gapminder1.sh
```

and 

```bash
sh ~/Desktop/pipes_gapminder2.sh
```

Note that you might need to modify the path to the file based on the file strcuture you have created.

Answer the following questions on the **Etherpad**:<br>
a. What does the pipes_gapminder1.sh files do?<br>
b. What does the pipes_gapminder2.sh files do?<br>
c. What do you expect to find on the output_test.txt file?<br>
d. Where is the file located?<br>

***Activity***<br>
Using nano, modify `pipes_gapminder3.sh` to redirect the output file onto your desktop
Hint: You should use the `mv` command outside/ after the loop is finished. 

## While loops

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
Run the `while_loop.sh` file on the command line and observed the output. Once you are familiar with it, start modifying the loop by doing the following. Tell us what is happening on each case on the etherpad:<br>
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

***Etherpad question***<br>
Go to the etherpad and explain the difference between *while loops* and *for loops* in one or two sentences. 


## Conditionals

*Conditionals* allow us to control what happens on your script based on a condition. As in the case of many hypothesis,
*conditionals* use `if` and `then` statements. The structure of an `if` condition is as follows:

**if CONDITION_IS_MET<br>
	then DO_SOMETHING<br>
fi** 

When the condition required by the `if` statement is met, the `then` command inside the statement is executed.
If the condition is not met, then the internal command will not be executed. As is the case of *loops*, we need to indicate the end of the conditional. Here we will use `fi` to signal the end of the conditional. 

Let's run a conditional that compares two numbers: 

***Activity***<br>
Run the `conditional.sh` file on the command line and observed the output. Once you are familiar with it, change the *integer* variable from 1 to 2 (o any other number). What happened? Could we try for more than one condition?<br>

Yes! We can add other conditionals to this statement. Besides using the *if/then* comparison we can capture an alternative 
condition by using `elif` and `else`. 

***Activity***<br>
Run the `conditionals_multiple.sh` file on the command line and observed the output. Once you are familiar with it, change the *integer* variable by doing the following:<br>
a. Change *interger* from 1 to 2 and notice what happends.<br>
b. Change *interger* from to to 3 and notice what happends.<br>
c. Change *integer* from 3 to 32 and notice what happends.<br>


## Conditionals and loops

*Loops* and *conditionals* are useful on their own and work really well together. By combining *loops* and *conditionals*
we can examine and separate large amounts of data.<br>

***Activity***<br>
Run the `loops_and_conditionals.sh` file on the command line and observed the output. On particular notice the syntax and organization of this sample code. Take a few minutes to run some modifications on the code. For example, you can change the range of numbers at the start of the loop or the comparison operator<br>



***FIVE MINUTES BREAK***

## Using adequate variable names
***Etherpad question***<br>
Run the `loop_question1.sh` and `loop_question2.sh` files on the command line and answer the following questions. <br>
a. What is the output? <br>
b. What is different between these loops? <br>
 
Using not informative variable names might be problematic, because you or other people looking at your code, might not know what the variable is referring to. **Avoid this issue by using variable names that are indicative and pertinent to the situation**

## Adding comments to your shell script

Adding comments to your script is essencial to secure its future usability and sharing potential.
Without comments, it can be difficult to recall the function of a given line of code or understand
scripts shared with collaborator. Thus, it is customary to add comments that explain the 
actions of certain parts of the script.

You can add comments to your script by using nano.

Comments are marked by the use of the `#` character. They represent something that a **HUMAN USER**
can read and understand. The computer ignores lines of code preceded by the `#` character.

The commented `pipes_gapminder1.sh` script looks as follows:

```bash
#Loop through files that start with a V
for filename in V*.txt
do
    echo $filename # Print the file name to the terminal
    head -5 $filename | tail -2  # Pipes the first 5 lines within the file, and prints the last two lines
done
```
Running the updated code will produce the same output as before. However, now our script
is more easy to use by other people as well as our future selfs!

***Activity***<br>
Using nano, add comments to the `pipes_gapminder2.sh` and `pipes_gapminder3.sh` files. Show this comments to the person next to you to make sure that they can read them and understand them

## Using the script with arbitrary files:

We can also make our script more versatile by chanding our use of variables. For example,
we can let the user specify which data file they want to use by changing the variable name to "$1".
Inside a shell script, $1 means "the first filename (or other argument) on the command line". 
For example, the firs_argument.sh script:

```bash
#Runs script with first argument given in the command line
echo "$1"
head -n 5 "$1" | tail -n 2
```

...requires additional input in the command line. This new shell script can be executed as:

```bash
sh ~/Desktop/arguments.sh Italy.cc.txt
```

Moreover, we can assign variable names to other arguments inside the script in order to
further increase its versatility. For example, we can change hard coded variables as follows:

```bash
#Runs script with first argument given in the command line
echo "$1"
head -n "$2" "$1" | tail -n "$3"
```
... and execute the file as:

```bash
sh ~/Desktop/arguments.sh Italy.cc.txt 4 1
```

***Activity***<br>
Modify the input argument for the `arguments.sh` file in the command line. Try the following:<br>
a. Changing the country name. <br>
b. Changing the $2 argument number. <br>
c. Changing the $3 argument number. <br>

***Etherpath question***<br>
What does the $2 and $3 variables mean in the context of this script?


## Debugging the script

Even if we are carefull, it is possible that we make mistakes while writing our script. Running
a script with an error (bug) will results on an empty output in our terminal. In order to find
any bugs in our script we need to use the -x flag to run bash in debug mode. Running a script in 
debug more prints out each command as it is run, which will help to locate errors.

 ```bash
sh -x first_argument_sh Italy.cc.txt 4 1
```

# Final shell exercise

Now, we will create a final shell script that works on the gapminder data set. 

Your script should be able to:<br>
a) Loop through the files in the gapminder data set.<br>
b) Find all files that belong to countries names that start with a vowel.<br>
c) Print the name of those files to the command line/terminal.<br>
d) Capture the first two lines of those files to a single output.<br>
e) Move the output file to the Desktop

Possible solution:
```bash
for filename in A*.txt E*.txt I*.txt O*txt U*.txt
do
    echo "$filename"
    head -n 2 "$filename" >> first_line_vowels.txt
done

mv -i first_line_vowels.txt ~/Desktop/
```
