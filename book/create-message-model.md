# Creating your Message system

This part of the book is the meat. In this part we will first create the "model" or database logic before creating a controller and view to let people visit our app and create a message in our database

## What models are

## What model we are creating

We are creating a simple contact form that collects people's contact details and the work they wish us as superstar developers they wish to have completed

## Generating your first model

To generate our model we can run a rails command-line generator command.

The command follows the schema of ```rails g model {name of model} {model database field name: model database type}```.

> The g stands for... generate. Like many things in Rails, there is a shortcut. Where possible use them. They reduce typos!

In our form we want to collect people's name, their email, phone number (if they want to share that), their company and the general gist of what they want us to do - in the form of a textfield.

We'll call our model Message, as that is what people will be sending, messages. In Rails, the convention is for the model to use a singular name, so if we have lots of messages, a single database entry would be a message. That is the pattern we follow.

So, we have the name of our model. We could just generate that file with ```rails g model Message``` but we will add some extra parameters to give us a head start.

All of the types of thing we can place into our model, and save to our database are:

The whole list of available types are:

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














To use one of these in our command we put the label of the database field, so monkey is monkey, and the type connected by a colon. So our monkey label would be ```monkey:string```.



Our command is therefore:

```sh
rails g model Message name:text email:text phone:text company:text  body:text   
```