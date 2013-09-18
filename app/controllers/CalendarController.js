App.CalendarController = Em.Controller.extend({
    monthName: function() {
        var monthNames = [ "January", "February", "March", 
                           "April", "May", "June",
                           "July", "August", "September", 
                           "October", "November", "December" ];
        
        
        return monthNames[this.get('content.month')-1];
    }.property('content.month'),
	
	actions:{
		today: function(){
		var obj ={
				day: App.calendar.day,
				year: App.calendar.year,
				month: App.calendar.month
			};
		
		}
	}
	
	
});
