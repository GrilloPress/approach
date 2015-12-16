# Creating your Message system

This part of the book is the meat. In this part we will first create the "model" or database logic before creating a controller and view to let people visit our app and create a message in our database

## What models are

## What model we are creating

We are creating a simple contact form that collects people's contact details and the work they wish us as superstar developers to have completed

## Generating your first model

To generate our model we can run a rails command-line generator command.

The command follows the schema of ```rails g model {name of model} {model database field name: model database type}```.

> The g stands for... generate. Like many things in Rails, there is a shortcut. Where possible use them. They reduce typos!

In our form we want to collect people's name, their email, phone number (if they want to share that), their company and the general gist of what they want us to do - in the form of a textfield.

We'll call our model Message, as that is what people will be sending, messages. In Rails, the convention is for the model to use a singular name, so if we have lots of messages, a single database entry would be a message. That is the pattern we follow.

So, we have the name of our model. We could just generate that file with ```rails g model Message``` but we will add some extra parameters to give us a head start.

All of the types of thing we can place into our model, and save to our database are:

|Available Type   	|What it is   	|
|---	|---	|
|integer   	|A whole number, like 1 |
|primary_key   	|   	|
|decimal   	|A decimal number, so something like 0.12   	|
|float   	| Very similar to decimal, it is a number like 0.12, but unlike decimal, it doesn't save the actual number, but rather binary point number stored like so: 1101010.10010  	|
|boolean   	|A boolean value is basically true or false. Many databases save this as 0 or 1 but it translates to either true or false   	|
|binary   	|Binary is 1001010   	|
|string   	|A string is a short bit of text. In MySQL it is best to use this where possible over text   	|
|text   	|A large chunk of text, much larger than a string but fundamentally similar. In PostGreSQL you should use this rather than strings   	|
|date   	|A date type that stores the year, month, and day values |
|time   	|A data type that stores hour, minute, and second values|
|datetime   	|A combination of the date and time, something like: Monday, 26-Aug-2010 12:00:00 UTC   	|
|timestamp    |A date and time used with a label like "created_at" |


To use one of these datatypes in our command we put the label or name of the database field, so monkey is monkey, and the data type afterwards connected by a colon. So our monkey label would be ```monkey:string```.

This would create a model, and a potential record in our database, with a column called monkey with the datatype of string.

In our app, our model will be called Message as we mentioned. Inside that model of a message we want to collect people's name, their email, potentially their phone number, their company's name and give them some room to write a long message explaining why they need our service.

Our command is therefore:

```sh
rails g model Message name:text email:text phone:text company:text  body:text   
```

When you run this command, you have told rails to run the g or generator command, and the type of thing to generate (a model), the name of the model and then what to place inside that model.

When you do, two major files that Rails creates for you are the model file itself ```app/models/message.rb```, and a "migration" file.

Inside our model, it is pretty sparse. It will look something like:

```
class Message < ActiveRecord::Base
end
```

Not much in there. Essentially a class with our Model name, inheriting ```<``` from ActiveRecord all of the default model capabilities to read and save to our database.

The migration file has a little more going on. A migration is essentially a file which designates in Ruby what transformation we need to see in our database. Each migration has a unique ID number, so yours will be different than mine.

This ID let's us go through each transformation of our DB and potentially, change, update or remove specific database moves.

Within the ```db/migrate``` directory you should have file called something like ```20151210232533_create_messages.rb``` with the following contents:

```rb
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :name
      t.text :email
      t.text :phone
      t.text :company
      t.text :body

      t.timestamps null: false
    end
  end
end
```

This file contains a class, which inherits from ActiveRecord's migration class. With that inheritance, it can create and update tables in your database, amongst other things.

Inside we have a method called change, indicating we are making a change, with a block where we call the ```create_table``` method.

We provide a symbol with the name of the table we want to create ```:messages```, and inside a do/end block we create all of our text columns with the labels to the right

Although Rails created this migration, it hasn't actioned it. We are ready to create this table in the database, but it hasn't happened yet. To action it, we run a rake (ruby make) command.

The command we use is:

```sh
rake db:migrate
```

When you have run this command you should see some output like so:

```
== 20151210232533 CreateMessages: migrating =================================== 
-- create_table(:messages)                                                      
   -> 0.0026s                                                                   
== 20151210232533 CreateMessages: migrated (0.0027s) ========================== 
```

This message tells us how quickly and successfully rake has been migrating the new table and columns into our database.

Congratulations, you now have your first model, and a database with your table in it.

### Seeding some data

Before we move on, let's seed our database with some example messages. This will help us manage the message creation admin panel and initial controller.

One of the several ways of seeing data is to add some examples to ```app/db/seeds.rb``` file and then run ```rake db:setup```.

Inside ```app/db/seeds.rb```, write the following:

```rb
Message.create(name: 'Andrew', email: 'example@fake.com', phone: '00000000000', company: 'Grillopress', body: 'Hi, I am writing a message!')
Message.create(name: 'Andrew', email: 'example@fake.com', phone: '00000000000', company: 'Grillopress', body: 'Yo, this is a second message')
Message.create(name: 'Andrew', email: 'example@fake.com', phone: '00000000000', company: 'Grillopress', body: 'Forgot to mention, buy some bread!')
```

Feel free to add some of your own messages. Once you have finished run ```rake db:setup```. This will trigger rake to create those messages in the database.

In our next section we'll wire up our controller to let us create messages through our a webpage, rather than rake, and view our messages as well.