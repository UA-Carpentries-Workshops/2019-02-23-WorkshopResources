# Lesson 1

## Graphical User Interface and the Command Line

Graphical User Interfaces (GUIs) are what we might be most familiar with and typically have mouse and keyboard support along with a more user friendly interface. Operating systems like Windows and MacOS utilize GUIs for navigation purposes (Finder/My Computer) as well as applications like iTunes, Photoshop, Word, and Excel. These are useful tools but can have drawbacks such as speed, hardware requirements, and/or compatibility issues. For these reasons the command line is still a useful tool among a variety of fields like biology, software development, mathematics, etc. We will start today by navigating the file system of our computers. Let's start by opening up our home directory with the more user friendly GUI provided with our operating systems.

 * Open Finder or My computer
 * What do we see?

This is what is called our Home Directory. Now let's make the leap into the command line by opening terminal or gitbash!

 * Split your screen in half: one side is the GUI, the other the command line
 * Do the command line and GUI seem similar in any way?

Notice that there could be some small differences between our own screen (the display) and what you seen in your computers. We have set our terminal/gitbash to have a white background and black font. This might not be the default on your case. You will still be able to follow along on this workshop, but let us know if you would like to change your own display. Likewise, the appearance of the command line window is a bit different between windows and mac. Fortunatelly we have both operative systems on display here, so you can follow along with the corresponding one.

### *Command Line Navigation*

Because the command line looks cryptic there are two things you can always do to orient yourself. `pwd` Stands for Print Working Directory and shows the root to the current directory you are in from left to right. Directories are indicated in the command line by a `/`.  The second command is `whoami` and will output the current user. 

```bash
whoami
```
```bash
pwd
```


**The file structure shown using `pwd` can be thought of as a tree of files with branches and nodes.**

What if we were not sure what `pwd` actually does?  For that we can use `--help` or `man`.  This will vary by operating system and `man` stand for manual. Try using each of these commands with `pwd` on your system.  Note: the order of each of these commands.

```bash
pwd --help
man pwd
``` 

*Exercise:*<br>
Use `man whoami` or `whoami --help` on your computer. What is the output? 

*Etherpad question:*<br>
Write down two other actions that you might execute on the GUI. For instance: moving a file.

Let's try some of these actions on the command line to see what they do.

#### cd: Moving across directories
Now that we know where we are lets ensure our GUI and command line are in the same directory. To move directories we 'change directory' using `cd`. This is followed by some sort of direction for the computer. For example: 

```bash
cd ../
cd ~
cd Documents/
cd /Users/usrname/Documents
cd
```

#### ls: Listing directory contents
To show what is in the current directory we use list `ls`. We can also give `ls` more direction to list the contents of other directories. 

```bash
ls
ls Documents/
```
Or change how we output the file contents using what are called flags. Flags are options that command after a command and tell that application to do something specific that is not default. How might we find out what these flags are and what they do?  Try some flags out that you find interesting. 

```bash
ls -lh
ls -lha Documents/
```

### Creating directories and files 
We create directories by using the make directory command `mkdir`. 

```bash
mkdir directory_name
```
Now we have some basic skills to start working with files.  Build a file structure for today's workshop.  The directories could look something like this (drawn on board/computer):

*Etherpad question*<br>
Write on the etherpad. Which one of the following commands would help you list the contents of a folder?<br>
a. pwd<br>
b. ls<br>
c. mkdir<br>
d. cd<br>

### *Viewing and Working With Files*
There are a variety of ways to view files. We will use a few of these methods to understand how they differ from each other. We will download a text file to the data directory. Download the file [here](https://github.com/UA-Carpentries-Workshops/2018-02-10-Tucson/blob/master/shell_lessons/data/the_road_not_taken.txt). 

**Viewing the content inside a file**
```bash
wc 	[PATH/]FILENAME
cat [PATH/]FILENAME
less [PATH/]FILENAME    -Hint: exit with 'q' key
head [-number] [PATH/]FILENAME
tail [-number] [PATH/]FILENAME
```
**Writing to a file**
```bash
file1 > file2	  write to a file

vs.

file1 >> file2  append to a file
```
**Pipes**
```bash
tail FILENAME | wc -l
```
*Etherpad question*<br>
Write on the etherpad. Which one of the following commands would help you capture the last lines on a file?<br>
a. ls<br>
b. cat<br>
c. wc<br>
d. tail<br>

*Etherpad question*<br>
Extract the following stanza into a file called 'second_stanza.txt' using the command line. Write your code into the Etherpad

Then took the other, as just as fair,<br>
And having perhaps the better claim,<br>
Because it was grassy and wanted wear;<br>
Though as for that the passing there<br>
Had worn them really about the same,


### *Creating a new file*
Now we will create a file. You can create and empty file by using the command `touch` and use a text editor to change it. 

```bash
touch file_name_touch
nano file_name_editor
```
Nano is what is known as a text editor. Text editors can be thought of as a very simple word processor without any bells or whistles.  It exists to write text into a file from the command line: that's it.  However, its simplicity makes it a powerful tool for compatibility and as a place to write programmable scripts.

##### Activity
Create a file in your current directory and write a one verse poem in that file. Then, use the commands that we have learned to examine your file.

### *Moving, copying, and removing files*
We can also copy, move and remove files and directories.

```bash
#Do w/ and w/o -i flag

rm -i [PATH/]SUBJECT_NAME [PATH/]NEW_TARGET_NAME
mv -i [PATH/]SUBJECT_NAME [PATH/]NEW_TARGET_NAME
cp -i [PATH/]SUBJECT_NAME [PATH/]NEW_TARGET_NAME
```

#### Activity

What is the output of the closing `ls` command in the sequence shown below?

```bash
$ pwd
/Users/jamie/data

$ ls
proteins.dat

$ mkdir recombine
$ mv proteins.dat recombine
$ cp recombine/proteins.dat ../proteins-saved.dat
$ ls
```
1.proteins-saved.dat recombine<br>
2.recombine<br>
3.proteins.dat recombine<br>
4.proteins-saved.dat

