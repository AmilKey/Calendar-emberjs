App.CalendarRoute = Em.Route.extend({
    serialize: function(obj) {
        return {
            year: obj.year, month: obj.month, day: obj.day
        }
    },
    setupController: function(controller, model) {
        var obj = {
            day:   model.day,
            year: model.year,
            month: model.month,
			days: calendar.getDaysInMonth(model.month, model.year)
        };
        controller.set('content', obj);
    }
	
});
