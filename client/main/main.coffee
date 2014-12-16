
Template.main.events
  'touchstart .evt-start': (event) ->
    event.preventDefault()
    Session.set 'playing', yes
    result = share.pickRandom()
    console.log result
    Session.set 'game', result.game
    Session.set 'category', result.category