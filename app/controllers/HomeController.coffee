App = require 'app'

module.exports = App.HomeController = Ember.ObjectController.extend

  GoCalendar: (year, month, day) ->
    if year and month and day
      @transitionToRoute 'calendar', {year: year, month: month, day: day};
