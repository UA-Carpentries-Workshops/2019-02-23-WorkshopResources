# Lesson 2

## Working With Data in bash and Version Control

Another benefit to using the command line is the ability to manipulate data files.  This utility can then be compounded by the use of loops, conditionals, and scripting which we will learn about later.  

Usage of the command line also allows us to use a version control application called git.  Version control is a useful tool as it tracks any changes to your files over time.  Imagine one may have several drafts saved of a single manuscript.  With version control we could track the edits made between drafts overtime in a single file.   

![Version Control PhD Comics](http://swcarpentry.github.io/git-novice/fig/phd101212s.png)


First we need to acquire the data we will be using today and tomorrow using `git`.  For this we will clone a repository with `git clone`.  When using any git commands we first call `git` followed by the specific command, `clone` in this case.

If you ever need to access a git help page follow this method
```bash
git [command] --help
```

Clone the repository for this workshop to collect the data.  Feel free to download this wherever you like.  We will be copying all the data files into our `data/` directory and deleting this cloned repository.



```bash
git clone https://github.com/UA-Carpentries-Workshops/2018-02-10-Tucson.git
```   

Copy the gapminder_by_country directory and the Afghanistan_raw.xlsx file only using the command line!

*Hint: `cp` cannot copy directories in its default usage.*

### Open source software and Github
Before we start working with any of this data we will use git to begin tracking our changes.  Note that `git` is a software application while Github is a website.  The website Github is commonly used with git and is a hosting server for git.  Github allows users to store their version controlled software and data files on their servers while also creating an open source develop community where people can access code to hopefully make that code better!  For this reason, Github is an excellent place for the development of large projects due to its centralized version control capabilities and global access.

Please take the time to make a Github account at [github.com](https://github.com/) if you have not yet already.  We will need to feed our Github information into git.

Now we will configure git to our Github account using the following commands.

```bash
git config --global user.name "my_username"
git config --global user.email my_email@gmail.com
``` 

Next we need to initialize our repository so git knows to start tracking changes.  A git repository is essentially a data structure were you will begin tracking any changes made to files.  Cd to the top of this workshops file structure and initialize it with git.  


```bash
ls -a

git init .

ls -a
```  



The first thing we should always do after initializing a repository is add a .gitignore file.  This file is a user created list of files that are to be ignored by git.  For example, if you have large data sets it is recommended that you do not push this to Github.  Therefore, we would ignore those files or the entire directory of data.

##### Activity
What to does the `.` signify before gitignore?

```bash
nano .gitignore

Type:
[path_to_data]/data/*
```

Great!  Before we get started on changing anything we should stage our git repository and send it to Github. This is part 1 of a 3 step process to send our changes to Github.  Staging --> Committing --> Pushing

### Staging your files

Staging your files means that you are preparing files to send to Github.  For example, we could stage our entire repository or we could stage individual files that are ready and leave unfinished files out of this phase. Staging is performed with the `git add` command.

```bash
git add [PATH]/file
git add . #This is an easy way to add what ever is contained in the current directory, and anything downstream
``` 

To check what we staged (what is different from our last commit) we use:

```bash
git status #tells us what files have changed

or

git diff --staged #tells us what has changed
git diff HEAD~1
```


The point of staging is to prep ONLY the files that need to be sent to Github.  Imagine we are working on a large project where many files have been changed but only a few have current bugs.  We want to select only the files that had bugs and have now been fixed to be sent to others for use or develop.  

## **Staging allows us to be specific about which altered files we want to send into the world.**  

### Committing files

The next step is to commit our added files.  This is the final stage before we send the files to github.  Committing tells git to send all the files that were staged to the git repository.  It is common usage to add a comment to any commit to give others and yourself what changes were made with this commit.  This is indicated with -m and a message in quotes. 

```bash
git commit -m "Updated a login bug"
``` 

#### Activity
Run a git status.  What happened to our added files?

To see the changes made within our commit files we have to use a different command than git diff.
Note: git diff can be called with two commit hashes for comparison as well eg. `git diff 820128fhsagd01 827610shufj92`

```bash
git show
git show HEAD~1
```

After commits have been made we look at commit information or we can also visualize a tree of commit information using `git log`

```bash
git log
git log --graph --decorate --all
```

Using log to find a hash of interest we could call a specific commit.
```bash
git show [id_hash]
```

### Setting up a Remote Repo on Github

Go to your Github page and create a new repository SWC_Tucson_2018_02_10_Tucson.  We will need the url to this remote repository to link it with our local git repository.

Use this link with this command to link the repositories

```bash
git remote add origin [your_link]
``` 

Before we send anything to the remote repository we want to make sure we are not missing anything that might be on the remote sever.  We will `pull` the remote repository to collect any files it may have.

```bash
git pull origin master
```

A note: You could skip the init step if you did not start your project locally and clone from a remote repository instead.

### Pushing our files to Github

Finally we have staged our changes, and committed them with a nice informational message.  Now we will send them to Github using the push command.  `git push` pushes these files within our repository to a remote server. In our case it will be our Github accounts.

```bash
git push
```

Now go to your Github account in a browser and see if our repository was pushed correctly.

Where is our data?

#### Activity
What is the difference between staging, committing, and pushing?<br>
Staging    =<br>
Committing =<br>
Pushing    =

### **Edit the small nano file from lesson one to demonstrate tracking changes using a smaller file as an example.**

## Working with Data

We have our repository up and running on Github, so now we can start working on that data we cloned!

```bash
cd [PATH]/data/gapminder_data
ls
```

If we look at our files we will notice a .xlsx file. .xlsx indicates that this file is a Microsoft Excel file.  Excel is a spreadsheet application with a GUI.  Let's open that file up using Excel or Numbers.  

* This file contains data about GDP per capita and life expectancy
* Take a look at how this data is organized
* Is there anything wrong with this file?
* We could edit this file in Excel but let's fix it using the command line

#### Activity
Now try using shell commands to view this file.  Do any of your methods work?


We need to convert this file to a plain text file.  We can do this by saving the file to as .txt.
File types commonly used in data analysis:
	* .txt = text file or tab separated file
	* .csv = comma separated file
	* .tsv = tab separated file

### Edit the new .txt file with nano

```bash
nano Afghanistan_raw.txt
```



## Preparing our raw data for downstream analysis

We now have an idea of what the structure of our data should be. Move to `gapminder_by_country/` using shell commands.

First we should check how many total lines of data are present.  We can do this using a wildcard `*`.  This wildcard means: match any character any number of time. This is quite handy when we might have 100's-1000's of files in a directory that we want to do the same operation on.  

This also demonstrates that proper file naming schemes are crucial when managing data.

```bash
wc -l Afghanistan.cc.txt
wc -l Afghanistan.cc.txt Chile.cc.txt
wc -l *.cc.txt
wc -l *
```

#### Activity
Pick a country with your the first letter of your last name.  Put that country into the Etherpad along with your name and inspect the file with the country chosen for any errors.  Report any errors to the Etherpad. If you finish early pick a remaining country and inspect that file as well. 

The Etherpad should look like

```bash
country_name - student_name - error if present
```

**Once all the errors have been found students should fix these errors using `nano`.**

Before we go further check our length of total files.  Does it match our original number?

### Merging our files into one data structure

Demonstrate the power/speed of command line versus a GUI like Excel

```bash
cd [PATH]/gapminder_by_country/
cat *
```

#### Activity
The first thing that we need to find is our header lines. Try a few methods to find this file within this directory.  List some of your favorites in the Etherpad.

Now that we have a header file we can begin building our data set.

```bash
mv country.cc.txt header.txt 

cat header.txt
cat header.txt *cc.txt | wc -l
cat header.txt *cc.txt | less
cat header.txt *cc.txt > gapminder.txt
```

Double check our new file
```bash
wc -l gapminder.txt
head gapminder.txt
tail gapminder.txt
```

#### Activity
Which method below would give us the same *data frame* in our gapminder.txt file?  Assume we have already changed country.cc.txt to header.txt.
* A `cat *.cc.txt > header.txt`
* B `cat *.cc.txt >> header.txt`
* C `cat *.cc.txt < header.txt`
* D `cat *.cc.txt > gapminder.txt`

#### Final activity

* Stage, commit, and push your repository to Github.
* Go to your Github Repo and ensure that all your changes have been pushed correctly

# Lesson 2.2 Working With Data Files in Bash

### Extracting Information With the Command Line
`grep` is bash's file pattern searcher and is an incredibly useful tool.  Think of it as the 'Find' or `ctrl f` command on your browser.  This is useful when searching files for IDs, dates, times, etc.

```bash
man grep
```

Let's try collecting all the data points with the year 2007 in them using grep.
```bash
grep '2007' gapminder.txt
```

#### Activity
Hmmmm that didn't seem to work like we wanted it to.  How might we might we check if grep could capture a search item as a single word and not part of a word? What command would you use?

<details><summary>Answer</summary>
<p>


```bash 
grep -w '2007' gapminder.txt

Output this to a 2007 file
grep -w '2007' gapminder.txt > 2007_subset.txt
```

</p>
</details>

Grep has many options and nuances that will take time to learn.  It is more important that you see this as a useful tool for finding lines of interest.  The fancy stuff can come later or as needed.

#### Activity: combine what you know
Write a command or set of commands in the Etherpad to grep the -v flag in the grep man/help page. 

### Sorting files

`sort` is another extremely useful tool when dealing with tab delimited data.  It does exactly what it says and sorts your file in many possible ways. The most common in delimited files is sorting by a column such as year, time, treatment, etc.  

What if we wanted to sort our 2007 file by the life expectancy column?  How might we find this information?

#### Activity
Find the flag to sort by a specific column in our file.  Post what you think is the correct flag in the Etherpad or vote for one that you agree with.

```bash
sort -k 4 2007_subset.txt
```

#### Final activity 2.2

Use sort combined with other bash commands to identify a critical flaw in the file 2007_subset_incorrect.txt file.

Post how/which commands you used to identify the problem and what is the problem in the Etherpad.


