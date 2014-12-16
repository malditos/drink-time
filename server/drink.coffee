
Games = new Mongo.Collection 'games'
Categories = new Mongo.Collection 'categories'

Meteor.startup ->
  console.log 'Server Drink'