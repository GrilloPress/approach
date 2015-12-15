# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.create(name: 'Andrew', email: 'example@fake.com', phone: '00000000000', company: 'Grillopress', body: 'Hi, I am writing a message!')
Message.create(name: 'Andrew', email: 'example@fake.com', phone: '00000000000', company: 'Grillopress', body: 'Yo, this is a second message')
Message.create(name: 'Andrew', email: 'example@fake.com', phone: '00000000000', company: 'Grillopress', body: 'Forgot to mention, buy some bread!')