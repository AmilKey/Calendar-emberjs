App = require 'app'

module.exports = App.HomeRoute = Ember.Route.extend
  model: (params) ->
    today = new Date()
    dateNow:        {year: today.getFullYear(), month: today.getMonth() + 1, day: today.getDate()}
    infoMessage: """
      Compiled on branch #{App.CONFIG.compilation.gitBranch}
      at #{App.CONFIG.compilation.date.toTimeString()}
      on #{App.CONFIG.compilation.date.toDateString()}
      """
