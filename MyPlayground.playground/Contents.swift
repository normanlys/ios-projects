enum Weekday: CaseIterable {
  case monday, tuesday, wednesday, thursday, friday, saturday, sunday
  
  mutating func advance(by dayCount: UInt) {
    let indexOfToday = Weekday.allCases.firstIndex(of: self)!
    let indexOfAdvancedDay = indexOfToday + Int(dayCount)
    
    self = Weekday.allCases[indexOfAdvancedDay % Weekday.allCases.count]
  }
}

Weekday.allCases
var weekday: Weekday = .tuesday
weekday.advance(by: 7)

struct Time {
  var day: Weekday
  var hour: UInt
  
  init(day: Weekday, hour: UInt = 8) {
    self.day = day
    self.hour = hour
  }
  
  mutating func advance(byHours hourCount: UInt) {
    let (dayCount, hour) = (self.hour + hourCount).quotientAndRemainder(dividingBy: 24)
    self.hour = hour
    self.day.advance(by: dayCount) // mutating function
  }
  
  func advanced(byHours hourCount: UInt) -> Time {
    var time = self
    time.advance(byHours: hourCount)
    return time
  }
}

var time = Time(day: .monday, hour: 0)
time.advance(byHours: 24)


enum Mathematics {
  static func getLength(x: Double, y: Double) -> Double {
    return (x*x + y*y).squareRoot()
  }
}

Mathematics.getLength(x: 6, y: 8)
