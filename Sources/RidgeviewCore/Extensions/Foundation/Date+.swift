import Foundation

// MARK: - Date
extension Date {
    public static func timeDiff(between date1: Date, and date2: Date) -> TimeInterval {
        return abs(date1.timeIntervalSince1970 - date2.timeIntervalSince1970)
    }
    
    public func minutesLater(_ numberOfMinutes: Int) -> Date {
        self.addingTimeInterval(.minutes(numberOfMinutes))
    }
    
    public func minutesAgo(_ numberOfMinutes: Int) -> Date {
        self.addingTimeInterval(.minutes(-1 * numberOfMinutes))
    }
    
    public static func UTC(year: Int = 1970,
                           month: Int = 1,
                           day: Int = 1,
                           hour: Int = 0,
                           minute: Int = 0,
                           second: Int = 0,
                           nanosecond: Int = 0) -> Date? {
        
        iso8601(timeZone: TimeZone.UTC,
                year: year,
                month: month,
                day: day,
                hour: hour,
                minute: minute,
                second: second,
                nanosecond: nanosecond)
    }
    
    public static func iso8601(timeZone: TimeZone,
                               year: Int = 1970,
                               month: Int = 1,
                               day: Int = 1,
                               hour: Int = 0,
                               minute: Int = 0,
                               second: Int = 0,
                               nanosecond: Int = 0) -> Date? {
        
        var calendar = iso8601Cal
        calendar.timeZone = timeZone
        
        let comps = DateComponents(year: year,
                                   month: month,
                                   day: day,
                                   hour: hour,
                                   minute: minute,
                                   second: second,
                                   nanosecond: nanosecond)
        return calendar.date(from: comps)
    }
    
    private static let iso8601Cal = Calendar(identifier: .iso8601)
}

extension TimeZone {
    
    public static let UTC = TimeZone(abbreviation: "UTC")!

}
