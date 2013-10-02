App = require 'app'

module.exports = App.CalendarController = Ember.ObjectController.extend

  daysByWeeks: (-> 
    date         = new Date(@get('year'), @get('month') - 1, @get('day'))
    firstDay     = new Date(@get('year'), @get('month') - 1, 1).toString()
    lastDay      = new Date(@get('year'), @get('month'), 1, -1).toString()
    daysInMonth  = new Date(@get('year'), @get('month'), 1, -1).getDate()
    daysInPrevMonth  = new Date(@get('year'), @get('month')-1, 1, -1).getDate()
    
    weekDays = 
      Mon:  0
      Tue:  1
      Wed:  2
      Thu:  3
      Fri:  4
      Sat:  5
      Sun:  6

    days = []

    startWeekDay = weekDays[firstDay.split(' ')[0]]
    if startWeekDay > 0
      for i in [startWeekDay-1..0]
        date = new Object()
        date.day = daysInPrevMonth - i 
        date.class = 'prev-next-day'
        days.push(date)

    for i in [1..daysInMonth]
      date = new Object()
      date.day = i
      if parseInt(@get('day'), 10) == i
        date.class = 'btnactive'
      else
        date.class = 'btn'
      days.push(date)

    stopWeekDay = 6 - weekDays[lastDay.split(' ')[0]]
    if stopWeekDay > 0
      for i in [0..stopWeekDay-1]
        date = new Object()
        date.day = i+1
        date.class = 'prev-next-day'
        days.push(date)

    return [
      days[0..6]
      days[7..13]
      days[14..20]
      days[21..27]
      days[28..34]
      days[35..41]
      ]
  ).property('day', 'month', 'year')


  monthPrev: (->
    month = parseInt(@get('month'))
    if month == 1
      return 12
    else if month == 12
      return 11
    else
      return month - 1
  ).property('month')


  monthNext: (->
    month = parseInt(@get('month'))
    if month == 1
      return 2
    else if month == 12
      return 1
    else
      return month + 1
  ).property('month')


  yearPrev: (->
    return parseInt(@get('year')) - 1
  ).property('year')


  yearNext: (->
    return parseInt(@get('year')) + 1
  ).property('year')


  monthName: (->
    date  = new Date(@get('year'), @get('month') - 1, @get('day'))
    month = 
      0: "January"
      1: "February"
      2: "March"
      3: "April"
      4: "May"
      5: "June"
      6: "July"
      7: "August"
      8: "September"
      9: "October"
      10: "November"
      11: "December"
    return month[date.getMonth()]
  ).property('month')


  toDate: (year, month, day) ->
    if year and month and day
      @transitionToRoute 'calendar', {year: year, month: month, day: day};


  toToday: () ->
    date  = new Date()
    day   = date.getDate()
    month = date.getMonth()+1
    year  = date.getFullYear()
    @transitionToRoute 'calendar', {year: year, month: month, day: day};

