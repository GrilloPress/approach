# Creating your message controller

A controller is the code that connects a URL with a view and that view with our model and database. It is the middleman of our app, connecting many parts together.

The controller also sets out the steps our application should go through in order to receive data and save it to our database (or rather, hand it to our model)

In this section we'll cover setting up our main CRUD methods for the message system.

CRUD means Create/Read/Update/Delete. CRUD is a common pattern you'll find in MVC and Rails applications. It is also very common pattern inside a controller.

So, in this chapter we'll cover building a controller that let's us, create messages, read saved messages, update saved messages and delete saved messages.

First we need to create our controller.

We do this by generating it with a Rails command. Like the model, it is a case of using a generator. To create a plain controller we can run ```rails g controller messages```. This will create our file without any methods or related view files.

We'll not just generate a plain controller however, we can use some additional parameters to set up our CRUD methods (though they will be empty).

The conventional way to create CRUD methods in Rails is through the methods index, show, new, create, update and delete.


```sh
rails g controller messages index show new create update destroy
```

> If you're are very sharp-eyed you may have noticed we used destroy instead of delete. This is because it is a Rails convention not to call files after the four RESTful verbs of GET, PUT, PATCH, DELETE

Once you run this command Rails will create a lot of files for you. Your output will look something like this:

```sh
create  app/controllers/messages_controller.rb                                                                                                               
  route  get 'messages/update'                                                                                                                                
  route  get 'messages/create'                                                                                                                                
  route  get 'messages/new'                                                                                                                                   
  route  get 'messages/destroy'                                                                                                                                
  route  get 'messages/show'                                                                                                                                  
  route  get 'messages/index'                                                                                                                                 
  invoke  erb                                                                                                                                                  
  create    app/views/messages                                                                                                                                 
  create    app/views/messages/index.html.erb                                                                                                                  
  create    app/views/messages/show.html.erb                                                                                                                   
  create    app/views/messages/new.html.erb                                                                                                                    
  create    app/views/messages/create.html.erb                                                                                                                 
  create    app/views/messages/update.html.erb                                                                                                                 
  create    app/views/messages/destroy.html.erb                                                                                                                 
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
- update your routes to include a route per method ```get 'messages/update' etc.```
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

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
```

Inside this file we are declaring a class called ```MessagesController```, which inherits from our ```ApplicationController``` class declared in ```app/controllers/application_controller.rb```, and inside it we have our six methods we asked Rails to generate along with the file.

At the moment, all these do is link up, due to a Rails convention, to a view file with the same name. That is, a method called index will look for a view file called index.html.erb within the ```app/views/messages``` directory.





> The new method exists to render the form for creating a new message. The create method is where the "dirty work" of creating and saving a record, whereas the new method connects to a ```new.html.erb``` file which contains a form.

