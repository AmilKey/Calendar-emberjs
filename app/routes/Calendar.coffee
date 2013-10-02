App = require 'app'

module.exports = App.CalendarRoute = Ember.Route.extend

  serialize: (obj) ->
    day: obj.day
    month: obj.month
    year: obj.year

  setupController = (controller, model) ->
    obj =
      day: 0
      month: 0
      year: 0
    controller.set 'calendar', obj


