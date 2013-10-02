App = require 'app'

App.Router.map ->
  @route 'home', {path: '/'}
  @resource 'calendar', { path: '/year/:year/month/:month/day/:day'}

 
