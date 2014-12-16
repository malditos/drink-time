

share.pickRandom = ->
  result =
    game: ''
    category: ''
  categories = share.Categories.find().fetch()
  number = Math.floor(Math.random() * (categories.length))
  games = share.Games.find(category:categories[number]._id).fetch()
  result.category = categories[number].name
  if games.length
    number = Math.floor(Math.random() * (games.length))
    result.game = games[number].description
  else
    result.game = ''

  result

Template.playingScene.helpers
  game: ->
    Session.get 'game'
  category: ->
    Session.get 'category'
  games: ->
    share.Games.find({category: Session.get('id')})

Template.playingScene.events
  'click .find-games, touchstart .find-games': (event) ->
    event.preventDefault()
    Session.set 'id', @._id
    Session.set 'viewGames', yes

  'touchstart .evt-random': (evt) ->
    evt.preventDefault()
    #result = share.pickRandom()
    result = share.gameInstance.getNextChallenge()
    console.log result
    Session.set 'category', result.title
    Session.set 'game', result.description


  'touchstart .evt-home': (event) ->
    event.preventDefault()
    Session.set 'playing', no


