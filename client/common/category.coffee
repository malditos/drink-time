class Category

  constructor: (@name) ->
    @challenges = []
    @sentIndexes = []

  pickRandomIndex: ->
    challengesIndexes = _.keys @challenges
    validIndexes = _.difference challengesIndexes, @sentIndexes
    randomIndex = Math.floor(Math.random() * (validIndexes.length))
    validIndexes[randomIndex]


  addChallenge: (challenge) ->
    # throw new TypeError() unless challenge instanceof share.Challenge
    @challenges.push challenge

  sentIsFull: ->
    @challenges.length is @sentIndexes.length

  flushSentChallenges: ->
    @sentIndexes = []

  getRandomChallenge: ->
    if @sentIsFull() then @flushSentChallenges()
    challengeIndex = @pickRandomIndex()
    @sentIndexes.push challengeIndex
    @challenges[challengeIndex]

share.Category = Category