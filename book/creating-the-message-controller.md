# Creating your message controller

A controller is the code that connects a URL with a view and that view with our model and database. It is the middleman of our app, connecting many parts together.

The controller also sets out the steps our application should go through in order to receive data and save it to our database (or rather, hand it to our model)

In this section we'll cover setting up our main CRUD methods for the message system.

CRUD means Create/Read/Update/Delete. CRUD is a common pattern you'll find in MVC and Rails applications. It is also very common pattern inside a controller.

So, in this chapter we'll cover building a controller that let's us, create messages, read saved messages, update saved messages and delete saved messages.

First we need to create our controller.

We do this by generating it with a Rails command. Like the model, it is a case of using a generator. To create a plain controller we can run ```rails g controller messages```. This will create our file without any methods or related view files.

We'll not just generate a plain controller however, we can use some additional parameters to set up our CRUD methods (though they will be empty).

The conventional way to create CRUD methods in Rails is through the methods index, show, new, create, update and destroy.

> If you're are very sharp-eyed you may have noticed we used destroy instead of delete. This is because it is a Rails convention not to call files after the four RESTful verbs of GET, PUT, PATCH, DELETE

Run the following command to generate a controller with the first two of those methods:

```sh
rails g controller messages index show
```

We're covering just the first two initially as they related to showing all of our messages and every message individually. Once we've covered that, we'll move into more complicated things such as making messages through a form.

Once you run this command Rails will create a lot of files for you. Your output will look something like this:

```sh
create  app/controllers/messages_controller.rb                                                                                                                                                                                                                                            
  route  get 'messages/show'                                                                                                                                  
  route  get 'messages/index'                                                                                                                                 
  invoke  erb                                                                                                                                                  
  create    app/views/messages                                                                                                                                 
  create    app/views/messages/index.html.erb                                                                                                                  
  create    app/views/messages/show.html.erb                                                                                                                                                                                                                                  
  invoke  test_unit                                                                                                                                            
  create    test/controllers/messages_controller_test.rb                                                                                                       
  invoke  helper                                                                                                                                               
  create    app/helpers/messages_helper.rb                                                                                                                     
  invoke    test_unit                                                                                                                                          
  invoke  assets                                                                                                                                               
  invoke    js                                                                                                                                                 
  create      app/assets/javascripts/messages.js                                                                                                               
  invoke    scss                                                                                                                                               
  create      app/assets/stylesheets/messages.scss 
```

What Rails is doing here is creating:

- controller file ```app/controllers/messages_controller.rb```
- update your routes to include a route per method ```get 'messages/index' etc.```
- a view file per method in ```app/views/messages```
- a test file ```test/controllers/messages_controller_test.rb```
- a helper file ```app/helpers/messages_helper.rb```
- a single JavaScript file ```app/assets/javascripts/messages.js```
- a single Scss file too ```app/assets/stylesheets/messages.scss```

That's a lot of files. The generation of so many files can be daunting, but we'll go through them all so don't fret.

If we open up our new controller file ```app/controllers/messages_controller.rb```, you should see:

```rb
class MessagesController < ApplicationController
  def index
  end

  def show
  end
end
```

Inside this file we are declaring a class called ```MessagesController```, which inherits from our ```ApplicationController``` class declared in ```app/controllers/application_controller.rb```, and inside it we have our first two methods we asked Rails to generate along with the file.

At the moment, all these do is link up, due to a Rails convention, to a view file with the same name. That is, a method called index will cause Rails to look for a view file called index.html.erb within the ```app/views/messages``` directory.

If we visit our application using the route of ```localhost:3000/messages/index``` you'll see a simple message of:

```
Messages#index

Find me in app/views/messages/index.html.erb
```

If you find that file, ```app/views/messages/index.html.erb```, you'll see that message again, in simple HTML.

The wiring that enables this is within your routes file. This is located: ```config/routes.rb```. Inside that file you'll see:

```rb
  get 'messages/index'
  get 'messages/show'
```

These get allow us to tell Rails to allow us to use the messages/index route. By convention again, Rails presumed we have a controller called messages, and each additional URL part has a method. If they don't, Rails will raise up an error.

## Getting all of our messages

To do this we need to call up our Message model from our controller and retrieve all messages. The code to achieve this is very simple. At first, this seems pretty magical like most of Rails.

The code you need to write is:

```rb
# app/controllers/messages_controller.rb
def index
  @messages = Message.all
end
```

Here what we have done is:

1. Added a line within our index method
2. Created an instance variable called messages. Instance variables start with the ```@``` symbol. An instance variable is basically a variable that gets created every time Ruby makes an object. When we create an instance (by visiting the website) the instance variable will be filled with whatever data that is right that second. So, if we have hundreds of messages a week, one week this instance variable will have 100 messages inside it, the next week it will have 200.
3. We have set our ```@messages``` instance variable to equal our ```Message``` model. Using the capitalized Message indicates to Rails that we want a model with that name. We have chained the ```Message``` model with a the method of ```.all```. This, as you may have guessed, gets back __all__ of the messages from our database.

So, we have defined an instance variable called ```@messages``` and set its value to all of the messages inside our database.

We could call our instance variable anything, but it makes sense to call it ```@messages``` because we have more than one message in this variable.

## Updating our view to print out all of the messages

Let's now update our view file to print out in simple form, all of our messages. To do that we need to write a ruby block that uses the instance variable we defined in our controller.

In Rails, all instance variables declared in our controller are available in their corresponding view. So, if we created another instance variable called @rubbish, we could include that in our ```index.html.erb``` view file and have it printed into our HTML.

Right, let's print out our messages. Open our ```app/views/controllers/messages/index.html.erb``` file and add the following:

```erb
<!-- app/views/messages/index.html.erb -->
<% @messages.each do |m| %>
  <p><%= m.body %> - <strong><%= m.name %></strong></p>
<% end %>
```

Here what we have done is written some ERB, which is "embedded ruby", to call our controller and use the instance variable to print out every message. ERB is defined within the ```<% %>``` tags.

So, to recap what we've done:

1. We have called within our first ERB tag, our ```@messages``` instance variable. As our instance variable contains all of our messages, we need to loop through it to print our the individual messages
2. We've set up an ```.each``` loop. Naturally, you can set up other types of loops. If you had a million messages using a ```.each``` loop would make the app very slow, so a particular number would make more sense. For now, we want each and every message so we use an ```.each``` loop.
3. To get the loop started we use the do keyword with ```|m|``` being our __placeholder__. This placeholder can be anything but m for message makes sense.
4. Our looping code stops with the end keyword. This is contained within a tag at the end of our code block. It looks like this: ```<% end %>```.
5. Inside our do/end block we then write the individual code that will be repeated for every record found in our database. That is, for every message in the database, a loop is completed, and the code within the do/end block will be executed.
6. Our code then adds some additional methods within this block. Using the ```m``` keyword to stand in for each individual message, we can use each database field name as a method to print out that field's value. So, if we want to print out the body method in a message, we use ```.body``` after our placeholder of m. Or more simply stated, we write ```<%= m.body %>```
7. For this example we've just used our body and name database fields. We've also sprinkled some HTML around it so that each message is inside a paragraph, and the name of the sender of the message is in a strong tag and made bold.

Make sure your Rails server is running and visit your ```/messages/index``` route. If your app is running on localhost this will be something like:

```
localhost:3000/messages/index
```

You should see the three messages we seeded in the previous chapter (and more if you added some of your own!). Not exactly beautiful but we've got a database with some data in it, and wired up a page where that data is printed out. Small steps, but the basis of nearly all websites and web apps.

Add some additional fields, maybe our "company" field. If you ever need to double check how your database is structured, you can see this in the ```db/schema.rb``` file.

## Adding the read method

As well as reading out each and every message, it would be useful for our system to let us read individual records. Although our records are simple, they can get more complicated and any system allows for this.

This functionality is a second part of the R in CRUD apps. Read relates to both, reading ALL messages, and reading message 1 or 2, or 3 or... (etc.)

Open up our message controller again ```app/controllers/messages_controller.rb```, and update our show method like so:

```rb
def show
  @message = Message.find(params[:id])
end
```

As with our index method before we have defined an instance variable. This time, instead of message__s__. We use _message_. This is because we are showing an individual record, and so that makes sense being singular.

Again, as with the index method we call the Message Model by using a capitalized ```Message```. After that we chain the method find. This Active Record method, predictably tries to find the record in question. By default this looks for a number to match a message's ID.

If you replaced the ```params[:id]``` with a 1, then every time someone visited your show URL they'd get the first message. This is because you would be telling Rails to search for the message with the ID of 1 all the time,

Instead of hardcoding a number, we need something more dynamic. This is why we have used ```params[:id]``` within the brackets. This means, we will look for an ID in the URL to feed into this search query.

The way we have set up our routes so far, this would have to be in a URL like so: ```localhost:3000/messages/show?id=1```. Here we call the show URL and add the required ID with a number after a question mark, that is the ```?id=1``` part.

If you've created a PHP application before, you may have created a similar thing with a parameter of ```index.php?id=1``` etc to find individual posts.

Rails has a different way of handling this, more in-line with RESTful conventions. Instead of using ```?id=1```, we can update our route file and just use a number instead of the show URL.

To understand this, it is better to get updating our app.

In the routes file ```config/routes.rb``` replace:

```rb
get 'messages/index'
get 'messages/show'
```

With:

```rb
resources :messages
```

Because Rails apps, apps in general, require the full gamoult of CRUD methods, Rails has an in-built way of declaring all of those routes, and the correct RESTful way of doing so, in a one-liner.

This one change then, has updated how we can access our index method, we can now hit ```localhost:3000/messages```, with our show method, we can now just hit: ```localhost:3000/messages/1```

In the case of show method, the extra ```/1``` is treated like a URL parameter and is used by our controller code to find the message specified.

Our views this second don't actually reflect the call and retrieval of our database record - if you look at your console you will see however the machinery working behind the scenes.

Let's update our ```show.html.erb``` file to print out the full range of our message.
























## Rails Resources

As Rails is based heavily on convention, there is also an easier way of declaring all of these routes. We can do this by declaring ```resources``` with symbol afterwards connecting it to a specific controller.

This will automatically make all of the GET routes, and unlike what we have currently, the correct methods for destroying and updating our messages.

Let's remove all those get links with this one liner:

```rb
resources :messages
```

Lovely bit of refactoring there!

A second thing to do is to delete the ```app/views/messages/delete.html.erb``` file. This was never needed. We don't render a HTML page when we delete a record.

Now, if you visit  ```app/views/messages/index.html.erb``` you'll see we are no longer on the index method. This is because the show method handles any GET attempt to messages with parameters after the ```messages/```.

> INSERT --- To see this is in action, add the following code .... sub-tut for URL parameters

> The new method exists to render the form for creating a new message. The create method is where the "dirty work" of creating and saving a record, whereas the new method connects to a ```new.html.erb``` file which contains a form.

