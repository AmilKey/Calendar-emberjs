var Calendar = function() {
    _getDaysInMonth = function(month, year) {
        return new Date(year, month, 0).getDate();
    };
    return {
        getDaysInMonth: _getDaysInMonth
    }
	
};

window.calendar = new Calendar();
window.App12121212 = Ember.Application.create({
    calendar: { 
		day: new Date().getDate(),
        month: new Date().getMonth()+1, 
        year: new Date().getFullYear()
    }
});
