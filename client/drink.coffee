load = ->
  share.Games = new Mongo.Collection 'games'
  share.Categories = new Mongo.Collection 'categories'

Meteor.startup ->
  Session.setDefault 'playing', no
  Session.setDefault 'viewGames', no
  load()


  harcodedChallenges = []

  # Mocked challenges from database, delete later
  for i in [0...5]
    challenge =
      title: "challenge #{i}"
      description: "description #{i}"
      shots: i
    harcodedChallenges.push challenge

  category = new share.Category('Rules')

  for rawChallenge in harcodedChallenges
    category.addChallenge new share.Challenge(rawChallenge.title, rawChallenge.description, rawChallenge.shots)

  share.gameInstance = new share.Game()
  share.gameInstance.addCategory category

  # game.getCategoriesNames()
  # game.disableCategory categoryName


Template.layout.helpers
  playing: ->
    Session.get 'playing'

Template.addGames.events
  'keypress .set-category': (event) ->
    if event.which is 13
      name = $('.set-category').val()
      if name and name isnt ''
        category =
          name: name
          games: []
        id = share.Categories.insert category
        console.log id
        Session.set 'categoryId', id
      $('.set-category').val('')

  'keypress .set-game': (event) ->
    if event.which is 13
      description = $('.set-game').val()
      if description and description isnt ''
        game =
          description: description
          category: Session.get('categoryId')
        id = share.Games.insert game
        share.Categories.update Session.get('categoryId'), $push: games:id
      $('.set-game').val('')