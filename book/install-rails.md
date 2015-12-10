# Installing Rails

Rails is likely one of the most popular and well-known web frameworks. It is also without doubt, the Ruby programming language's killer app/library.

The major benefit of Rails however, is that it is a great framework to make your a productive developer.

Rather than spend any more time on why Rails is great, let's get building with it and start you on your journey to becoming a productive web developer.

## Testing if we have Ruby

The first thing we have to do is test we have Ruby installed.

To do this, open up a terminal and write the following in your command-line:

```
$ ruby -v
```

> ##### Terminal? Command-line?
> If you don't know what a terminal is, it would be worth your time getting used to it before proceeding.
> Find out how to move around your filesystem, create a file, delete a file etc.
> Once you feel comfortable enough in the command-line, jump back into the book!
> It is also worth noting that throughout this book, code commands that start with ```$``` are to be placed in your terminal command-line.
> Some resources to get used to the terminal are:
> + [Learn CLI the hard way](http://cli.learncodethehardway.org/book/) -- you don't have to complete this all. Feel free to just do a few chapters to get the hang of things.

The ```ruby -v``` command should return something like:

```sh
ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux] 
```

The  ```ruby -v``` command breaks down to:

1. Call the ruby language and all the tools it adds with ```ruby```
2. Use the flag of ```-v``` which is short for version, which echos the version to the command-line

Depending on your success, you should have a ruby version installed. If not, go install one now.

> #### Bonus Section
> Need help installing Ruby, find the bonus section here {{ installing-ruby.md }}

## Installing the Rails gem

If you have much experience with Ruby, you'll know that the libraries are called Gems. A pretty cute name. Rails, like many other libraries, is installable from a gem.

To install a gem you run a command like so:

```sh
$ gem install {{name of thing you want to install}}
```

To get Rails you therefore run:

```sh
$ gem install rails
```

Once you've entered that command you'll start seeing other gems being installed. The gem system installs the Rails gem, but also all the other libraries that Rails needs to run.

This command can take a while. Part of what takes so long can be downloading all of the documentation locally. 

> To avoid installing the documentation locally you can add the command ```--no-document``` to every ```gem install``` command after the library. So, install rails would be:
> 
> ```sh
> $ gem install rails --no-document 
> ```
> 
> This works on a gem by gem command. If you want this behaviour to be standard you have to edit your global gem installer's configuration file ```.gemrc``` by adding the line ```gem: --no-document```.

After the gem has finished installing, let's test it is running - like we did with ruby. Run the following:

```
$ rails -v
```

This should reply with the number of rails which should be 4.something.something.

## Install Sqlite

Throughout this book we are going to use Sqlite.

Sqlite is a SQL database that creates a local ```.sqlite``` file on your fileserver which stores your database.

Sqlite is basically what powers Android applications. It is not as robust or scalable as MySQL or Postgresql but if your app is small, it will be more than good enough. [For more information about when to use Sqlite, see the Sqlite website](https://www.sqlite.org/whentouse.html)

To install Sqlite, [you need to download the file for your distribution from the website](https://www.sqlite.org/download.html) and install it.

If you have a problem getting sqlite to run, google ```install sqlite {{your operating system}}``` which should return decent documentation.

#### Installing Sqlite on Debian and Ubuntu

To install Sqlite on Debian systems, including Ubuntu, it is a case of using the ```apt-get``` system. Run the following command:

```
$ sudo apt-get install sqlite3 libsqlite3-dev
```

#### Installing Sqlite on Codio

If you are using Codio to follow along with this tutorial, run the following command:

```
$ parts install sqlite3
```

#### Installing Sqlite on Windows

...

Congratulations! You've installed Rails and Sqlite! In the next chapter we'll scaffold our app and start doing something a bit more meaningful

#### Further reading

If you want to know more about the command-line, the gem ruby library and dependency system, the following links may be helpful:

+ [Learn CLI the hard way](http://cli.learncodethehardway.org/book/)
+ [Learn Ruby in Y minutes](http://learnxinyminutes.com/docs/ruby/)
+ [Ruby Gem basics](http://guides.rubygems.org/rubygems-basics/)