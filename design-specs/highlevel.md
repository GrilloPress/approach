# Approach

Approach is a simple application created in Laravel which captures messages via a form.

An example where this app could be used is as a landing page with a sign up form.

## Features

+ The form should allow visitors to create a message
+ Admins should be able to sign in and see messages
+ Admins should be able to filter and review messages
+ Admins should be able to add notes to messages
+ Admins should be able to close/mark as actioned messages
+ Admins should be able to forward messages on as emails
+ Admins should see a simple dashboard of all messages
+ The form should sit on an attractive static website

## Routes

```
/
/admin
/admin/messages
/admin/messages/{id}
/admin/messages/{id}/notes
```

## Models

user (admin)

message
  - has many notes
  - title (text)
  - body (text)

note
  - belongs to message
  - user (who wrote the message)
  - title (text)
  - body (text)