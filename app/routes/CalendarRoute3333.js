App = require('app')

App.CalendarRoute = Em.Route.extend({
   
model: function() {
	var Calendar = function() {
		    _getDaysInMonth = function(month, year) {
			return new Date(year, month, 0).getDate();
		    };
		    return {
			getDaysInMonth: _getDaysInMonth
		    }
		};
	calendar = new Calendar();

    var today;
    today = new Date();
    return {
        year: today.getFullYear(),
        month: today.getMonth() + 1,
        day: today.getDate(),
	days: calendar.getDaysInMonth(today.getMonth() + 1, today.getFullYear())
    }
  },

    serialize: function(obj) {
        return {
            year: obj.year, month: obj.month, day: obj.day
        }
    },
    setupController: function(controller, model) {
	 var today;
      	 today = new Date();
        var obj = {
            day:  model.day,
            year:  model.year,
            month: model.month,
	    days: model.days
        };
        controller.set('content', obj);
    }
});
	

