# Creating your message controller

A controller is the code that connects a URL with a view and that view with our model and database. It is the middleman of our app, connecting many parts together.

The controller also sets out the steps our application should go through in order to receive data and save it to our database (or rather, hand it to our model)

In this section we'll cover setting up our main CRUD methods for the message system.

CRUD means Create/Read/Update/Delete. CRUD is a common pattern you'll find in MVC and Rails applications. It is also very common pattern inside a controller.

So, in this chapter we'll cover building a controller that let's us, create messages, read saved messages, update saved messages and delete saved messages.