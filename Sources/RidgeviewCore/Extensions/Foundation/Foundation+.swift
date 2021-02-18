import Foundation

// MARK: - TimeInterval
extension TimeInterval {
    
    public static func seconds(_ seconds: Int) -> TimeInterval {
        TimeInterval(seconds)
    }
    
    public static func minutes(_ minutes: Int) -> TimeInterval {
        TimeInterval(minutes * 60)
    }
    
    public static func hours(_ hours: Int) -> TimeInterval {
        TimeInterval(hours * 60 * 60)
    }
}

// MARK: - Int
extension Int {
    
    public var seconds: TimeInterval {
        TimeInterval.seconds(self)
    }
    
    public var minutes: TimeInterval {
        TimeInterval.minutes(self)
    }
    
    public var hours: TimeInterval {
        TimeInterval.hours(self)
    }
}

// MARK: - Double
extension Double {
    public var intValue: Int {
        Int(self)
    }
}

// MARK: - String
extension String {
    
    public mutating func trim() {
        self = self.trimmed()
    }
    
    public func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
