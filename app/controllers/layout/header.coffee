User = require 'zooniverse/models/user'

class HeaderController extends Spine.Controller
  tag: 'header'
  
  constructor: ->
    super
    @render()
    
    User.on 'change', (e, user) =>
      @render()

    Spine.Route.bind 'change', =>
      @render()

  render: =>
    if Spine.Route.path? is "/"
      @html require('views/home/header')
        user: User.current
    else
      @html require('views/header')
        user: User.current

module.exports = HeaderController