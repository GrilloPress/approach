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

To do this we need to call up our Message model and retrieve all messages

```rb
def index
  @messages = Message.all
end
```




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

