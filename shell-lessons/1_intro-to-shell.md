# Shell Lessons

# Getting started

In your browser

* Open a tab and go to the Etherpad
* Open a tab and go to Github and login with your account
* Open a tab and go to the Workshop website and make sure you have installed the required software for your system. `Red sticky` if you need help. 
* Open a tab and go to [Explain Shell](http://explainshell.com/)
* Open a tab and go to the Shell Share in the link in the Etherpad
* Open `Terminal` or `git bash` and enter `nano` to make sure you have `nano` installed.
* Open a tab and go to our Github repository. Use the link in the Etherpad.

## What is the shell?

[Software Carpentry Intro to Shell](https://swcarpentry.github.io/shell-novice/01-intro/index.html)

The shell is a program that gives you a way to access commands that let you do stuff on your computer. 

We are going to learn all of the most common commands and how we can combine them to automate complex tasks.

It is also called the command-line interface because you type commands on a line like this:

> ```$ ls -la ```

In this case we are using BaSh (Born Again Shell), but there are lots of different shells. BaSh is very common on UNIX and Linux operating systems.

## The three shells used in this workshop

### Windows

If you are on Windows you are using the BsSh emulator that you installed with Git. This is an emulator because it basically fakes the real BaSh commands to make them work on Windows.

### MacOS

MacOS is built on UNIX so it has a built-in command-line with all of the UNIX commands we need for this workshop.

### Linux

Most versions of Linux come with BaSh by default.

## What is it good for?

The shell provides a lot of commands that you can combine to manage and process your data. You can use these commands to build scripts that you can to automate repetitive tasks.

For example, many researchers use the bash commands to convert their unstructured data into structured data.

# Navigating Files and Folders (Directories)

[Software Carpentry Navigating Files and Folder](https://swcarpentry.github.io/shell-novice/02-filedir/index.html)

Open File Explorer and go to the `home` directory. Snap this window next to the terminal or git-bash window so you can see them side-by-side. 

(Windows people can use Window-key + arrow to snap windows)

```
C:\Users\<your user name here>
```

Let's start with listing files and folders.

```
$ ls
```

What did you see? Does it look the same as what you saw in File Explorer?

`ls` lists files and folders.

## Where am I?

Knowing where you are in the filesystem is harder on the command line, but we have a command to help us with that.

```
pwd
```

`pwd` stands for `present working directory` and it will tell you the `path` to where you are in the filesystem. It starts with the root.

In UNIX this is `/` and in Windows this will likely be something like `C:\`.

What did you see? Does it look like the path you see in File Explorer?

## `ls` (list files and folders)

Let's get back to `ls`.

`ls` has lots of options that you can use to sort and format the listing, just like you can do in File Explorer.

Let's see what they are. On Windows you can run the command:

```
ls --help
```

and on Mac you can use:

```
man ls
```

What did you see? A description and lots of options? Great.

Let's try one of the options.

```
ls -l
```

What did you see? It looks a little different than the output from 

```
ls
```

Try them both. See the difference?

`ls -l` shows us more details about the files:

* permissions
* last date modified (or created)
* size

This is called the `long` format, hence `-l`.

Sometimes there are hidden files and folders. These start with a `.`. `ls` won't show hidden things unless you give it the -a option.

```
ls -a
```

Now you will see all files or folders.

You can also combine options like this:

```
ls -la
```

or like this

```
ls -l -a
```

Try them both. You should see the same output.

This shows all files and outputs the long format.

> REMEMBER: You can combine options for any of the shell commands that have options.

## Moving around

You know how you can double-click on a folder to see inside of it? There is a command for that in shell. 

```
cd --help
```

`cd` stands for `change directories`.

There are two ways to `change directories`.

`cd` plus a `path` to where you want to go
```
cd /lets/go/here
```
`cd` plus `..` to go up one level in the filesystem (go into the parent folder)
```
cd ..
```

### Going home
We are currently in the `home directory`. This is a location in the filesystem where your your personal files are stored by default. It is a common operating system convention.

On Windows this will be:
```
C:\Users\<your user name here>
```

There is a shortcut for something called the `home` directory. 

```
cd ~
```

If you ever get lost and need to get back home, use the above command. Try it now and then list the files.

```
cd ~
ls -la
```

Do you see the same thing you did before?

## Absolute paths and relative paths

Let's talk about paths some more. We can get to directories with a `relative` path or an `absolute` path.

### Absolute paths

Absolute paths always start from the `root` of the filesystem.

```
/c/folderA/folderB/folderC
```

### Relative paths

Relative paths are relative to the current location

```
folderB/folderC
```

You can also go up levels `relative` to the current location.

```
cd ../../..
```

# Working with Files and Directories

[Software Carpentry Working with Files and Directories](https://swcarpentry.github.io/shell-novice/03-create/index.html)

We can create folders and files. Let's setup the directory structure that we will use for the rest of the workshop. It is going to look like this:

```
SDC_02-23-2019
    |
    repository
        |
        thesis
        analyses
        data 
            |
            original_data
            processed_data
```

Let's create the `SDC` folder withe `make directory` command.

```
mkdir SDC_02-23-2019
```

Now we can use `tab complete` to create the rest of the directories.

```
mkdir SDC_02-23-2019/repository
mkdir SDC_02-23-2019/repository/thesis
mkdir SDC_02-23-2019/repository/analyses
mkdir SDC_02-23-2019/repository/data
```

```
mkdir SDC_02-23-2019/repository/data/original_data
mkdir SDC_02-23-2019/repository/data/processed_data
```

Let's go into the `SDC` directory. We will spend the rest of the workshop here.

How do we get there?

```
cd SDC_02-23-2019
```

Also use File Explorer to drill into this folder. Do you see the sub-folders?

Let's see what's in here. How do I list the files and folders under repository?

```
ls -la repository
```

Do you see the analyses and data folder?

What is under data? How do I list it?

> use the relative path

```
ls -la repository/data
```

> use the absolute path and the shortcut to home

```
ls -la ~/SDC_02-23-2019/repository/data
```

Do you see the directories? Were they the same for each path you used?

LET'S REVIEW

> Use `cd` to move around in the SDC folder. See if you can use relative and absolute paths to move around. Check where you are are `pwd`. Do you end up where you expected to be?

When you are done playing around, make sure you are in the SDC repository folder.

How do you do that?

```
cd ~/SDC_02-23-2019/repository
```

## ASSESSMENT

How do I get to my home directory?

1) cd ~
2) ls ~
3) cd /
4) cd /c/home
5) cd /c/Users/marneedearman


## Creating and Editing Files

Let's create a file called. There are two ways of doing this.

### use `nano`

`nano` is a file editor like Notepad or the Mac equivalent.

Let's use it to create a new file.

```
nano thesis.txt
```

This will open `nano`.

> Let's learn about nano. All of the nano commands are shown at the bottom of the window

Start typing in the nano window. You see text.

If you want to save, hit 

```
Ctl + o
```

If you want to exit, hit

```
Ctl + x
```

Check to see if the file is there.

```
ls -la
```

### use touch

Let's create a new file but without using a file editor.

```
touch draft.txt
```

```
ls -la
```

Do you see your two files?

Open draft.txt in nano. How do you do that?

```
nano draft.txt
```

You should see nano and no text.

Exit nano. Do you remember how to do that?

```
ls -la
```

# Moving files around

You know how you can click and drag files around in File Explorer? We can move files around using the shell too.

To move files we use the `mv` command. `mv` stands for `move`.

Let's move thesis.txt into the thesis directory.

To do this you use the `mv` command and tell it the `path to` and the `name of` the file you want to move and the path to the new location. You can use the relative or absolute path. Let's use the relative path.

```
mv draft.txt thesis/
```

What happened? Let's list the files.

```
ls -la
```

You dont see thesis.txt where you created it, but you should see it where you moved it.

```
ls -la thesis/
```

> You can also use mv to rename files

Let's rename thesis.txt to thesis_final.txt

```
mv thesis/draft.txt thesis/thesis_final.txt
```

```
ls -la thesis/
```

You should see the new file name.

## Copying files

Let's make a copy of thesis_final.txt. To do this you use the `cp` command.  Just like `mv`, you tell it the `path to` and the `name of` the file you want to move and the path to the new location. You can use the relative or absolute path. Let's use the relative path.

```
cp thesis/thesis_final.txt thesis/thesis_copy.txt
```

```
ls -la thesis
```

Do you see your two files?


## Delete files and directories

To delete a file we use the `rm` command. `rm` stands for `remove`.

Let's try to delete draft.txt

```
rm thesis/thesis_copy.txt
```

What happened?

```
ls -la
```

You should not see thesis_copy.txt.

> `rm` is forever. Files do not go in the recycle bin.

## ASSESSMENT

I want to move a file from one location to another. What command do I use?

1) mp
2) mv
3) cp
4) cv

# Github and git and our source files

We are going to be working with a number of data files for the rest of the workshop. We will get those from Github and we will use `git` to pull them down from Github.

Go to this link (it is in the Etherpad)

> https://github.com/UA-Carpentries-Workshops/2019-02-23-WorkshopResources

Go to the top right corner of the page where it says `Fork`

Click `Fork`

This will make a copy of our `repository` in your account.

We will download a copy of the repository using `git clone`.

> Make sure you are in the SDC directory, up one level from repository

```
cd ~/SDC_02-23-2019
```

OR go up one level

```
cd ..
```

Check

```
pwd
```

Are you here?

`SDC_02-23-2019`

## git clone

On your Github account's repository page, click the Big Green Button and then click the clipboard button. This will copy the URL of the files to your clipboard.

Go back to the shell and type

```
git clone
```

and then paste the URL so that it looks like this

```
git clone https://github.com/UA-Carpentries-Workshops/2019-02-23-WorkshopResources
```

Hit enter.

Some things happened. Once it is done, list the files and folder. Do you see a new directory?

It is named the same as the name of the repository you cloned.

List what is inside of that directory using the command `ls 2019-02-23-WorkshopResources`. Do you see the `shell-lessons` folder?

Move into the `2019-02-23-WorkshopResources/shell-lessons` folder and run `ls` again. Do you see a `data` folder? This is the source data for our workshop.

Let's prepare this data for our workshop by making a copy in the repository data folder we created earlier. First let's move back up to the `~/SDC_02-23-2019` folder:

```
cd ~/SDC_02-23-2019
```

## copy the cloned data files into the original_data folder

What is the copy command?

Let's try to guess how to copy. We did this earlier with a single file at a time, but we need the content of the data directory copied to the data/original_data directory.

To copy a directory we need to use the `-r` option. This tells the copy command that it needs to be `recursive`, meaning that it needs to dig through the directory.

```
cp -r
```

We also need to tell the copy command what files to copy. To copy the contents of a directory we put in the path to the directory and add a *. This is the syntax that tells the cp command to get the contents but not the directory.

```
cp -r 2019-02-23-WorkshopResources/data/* repository/data/original_data/
```

What was copied? List the contents of the original_data directory.

```
ls -la repository/data/original_data
```

What is inside the gapminder_by_country directory?

```
ls -la repository/data/original_data/gapminder_by_country
```

That's a lot of files. Let's start working with them.

But first change directories so you are in the `repository` folder.

```
cd repository
```

```
pwd
```

## Gapminder

The gapminder study collected data on GDP and life expectancy over time for a bunch of countries. In the gapminder_by_country you see all of the countries with their GDP data. Let's look at one of them.

# Output

We don't need to use nano to see what is inside a file. We can send (output) the contents of a file to the screen. There are two commands we can use to do that. We wil start with `cat`.

## cat

`cat` will output the entire contents of a file to the screen all at once. Let's see that in action.

```
cat repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

What did you see?

## tail and head

We can out put only parts of a file, too.

### tail

`tail` will output the last 10 lines in a file. Let's see what it does.

```
tail repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

We see pretty much the same thing. But let's say we want to see the very last line. We can tell tail to do that.

```
tail -1 repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

We could also see the last 2 lines

```
tail -2 repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

### head

`head` will output the first 10 lines in a file

```
head repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

And we can tell it how many lines like `tail`.

```
head -1 repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

```
head -2 repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

## word and line count

`wc` will count the number of words or lines in a files

> From the help: Print newline, word, and byte counts

```
wc repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

How many lines do we expect to see?

```
wc -l repository/data/original_data/gapminder_by_country/afghanistan.cc.txt
```

# One gapminder file

Let's use what we have learned to create one big Gapminder data file. First let's change into the original_data directory for the sake of shorter commands.

```
cd repository/data/original_data/gapminder_by_country/
```

```
cat country.cc.txt
```

This is the file with the headers of the data in each country file. Each country does not have a header, but we want our `one file to rule them all` to have a header.

Rename the country file to header.cc.txt. How do you do that?

```
mv country.cc.txt header.txt
```

Did that work?

```
cat header.txt
```

We can `cat` more than one file at a time. Let's try that.

```
cat afghanistan.cc.txt vietnam.cc.txt
```

We can use a wildcard to cat any file that matches a pattern. Let's try to cat every country file. What do they all have in common? Their file extension `.cc.txt`

```
cat *.cc.txt
```

The star is a wildcard and it acts as a placeholder for the file names. 

That was a lot of stuff that went by really fast. What if I want to checkout the file? We can use a command that will paginate the output for us. Let's try it.

```
cat *.cc.txt | less
```

The only problem here is that we don't have the headers. So we need to cat the country files with the header file. We want the header first. How would we do that?

```
cat header.txt *.cc.txt
```

This make a lot of output. What can we do with it?

## output redirect

We can create a new file using a output redirect commands.

`>>` will create a new file or append the existing file
`>` will create a new file or overwrite the contents to the existing file

```
cat header.txt *.cc.txt >> ../../processed_data/all_countries.txt
```

## check the file

Let's go where we outputted the file

```
cd ../../processed_data/
```

If the commands worked you should see 1705 lines. How do we count the lines?

```
wc -l all_countries.txt
```

Let's look at the top 10 lines

```
head all_countries.txt
```

And the last 10 lines?

```
tail all_countries.txt
```

# Process the data

[Software Carpentry Pipes and Filters](http://swcarpentry.github.io/shell-novice/04-pipefilter/index.html)

Let's answer a question.

> What was the GDP in 2007?

## Get only the rows for year 2007

We only want to look at the data for 2007. This means we need to filter our data. We have a command for that called `grep`.

`grep` works on a file or output and takes a pattern to search on. 

```
grep 2007 all_countries.txt 
```

```
grep "\b2007\b" all_countries.txt
```

These two options give us different results. What does the "word boundary" do?

Let's make this output into a file. What command do we add?

```
grep "\b2007\b" all_countries.txt > 2007_gdp.txt
```

## pipe

Let's look at the line count for each of these grep commands. To do this we can combine commands into a pipeline of commands for a final output. To do this we use the `|` character. Let's country the grep output.

```
grep 2007 all_countries.txt | wc -l
```

```
grep "\b2007\b" all_countries.txt | wc -l
```

Notice that the counts are different.

## sort

We can sort the data too. Let's sort in reverse alpha order.

```
grep "\b2007\b" all_countries.txt | sort -r
```

### more chaining

Get the top 10 lines

```
grep "\b2007\b" all_countries.txt | sort -r | head
```

## cut (show only the columns you tell it to show)

```
grep "\b2007\b" all_countries.txt | sort -r | head | cut -f1
```

This will show only the first column in the data, which is the country name.

## Create a 2007 data file

How would we create a file with the 2007 data in it?

How do we also include a header?

# Analyze the data (exta credit)


> What are the top 10 countries for GDP in 2007?

> What are the bottom 10 countries for GDP in 2007?


# git

`git` is a command line change tacking program. You use it to keep a history of changes to your files.

## Why is this important?

An example: are you working with data files? Using `git` you can track all changes that you made to your data for proof of work.

An example: you are working on your thesis and you want to track changes to your thesis so you can go back to previous revisions as needed. Instead of keep a bunch of files with all the different revisions, you can keep track of them with git and only have one file. You can keep track of small changes and major changes, as you see fit. It is more flexible that way.

An example: Working on a program with others. Use git to collaborate. You can keep each other from overwriting the others's work and you can see what everyone has been changing and working on.

## Git v Github

`git` is the command line tool we use to manage changes to our files. Github is a place on the internet where we can store our files and that also keeps track of the changes to our files. We use `git` to send our files to Github and to get files from Github, along with the history of changes to those files.

Github is basically a place on the internet where you can share your work with the whole world.

Put on Github and share with the world!!

## get help with git

```
git --help
```

## git init (create a new git repository)

## git status (see what has changed)

## git add (stage what you want to save)

### what is staging and why do we do this?

You dont always want to save every change that you have made. We can stage changes and save only the changes we are ready to save.

## git commit

## git log (see a log of all the commits)

## git diff (see the changes)

## git checkout (checkout the changes for a file or an entire commit)

## git push

Before we can push we need a remote repository to push to. Let's try creating that on Github.

## staging and committing (workflow)

CHANGED FILES       STAGED FILES        COMMIT

FA

FB                  FB

FC                  FD                  COMMIT -->      CHANGES ARE SAVED

FD
