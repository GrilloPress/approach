# Creating your Message system

This part of the book is the meat. In this part we will first create the "model" or database logic before creating a controller and view to let people visit our app and create a message in our database

## What models are

## What model we are creating

We are creating a simple contact form that collects people's contact details and the work they wish us as superstar developers they wish to have completed

## Generating your first model

To generate our model we can run a rails command-line generator command.

The command follows the schema of ```rails g model {name of model} {model database field name: model database type}```.


Our command is therefore:

```sh
rails g model Message name:text email:text phone:text company:text  body:text   
```