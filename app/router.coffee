App = require 'app'

App.Router.map ->
    @.resource 'calendar', { path: '/:year/:month/:day'}
