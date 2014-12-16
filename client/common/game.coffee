class Game

  constructor: ->
    @categories = []

  addCategory: (category) ->
    @categories.push category

  getRandomCategory: () ->
    # ToDo return random
    @categories[0]

  getNextChallenge: () ->
    console.log @getRandomCategory()
    @getRandomCategory().getRandomChallenge()

share.Game = Game