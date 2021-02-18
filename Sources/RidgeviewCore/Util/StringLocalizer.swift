import Foundation

public struct StringLocalizer {
    public typealias LocalizedStringKey = String
    public typealias LocalizedStringvalue = String
    public let localized: (LocalizedStringKey) -> LocalizedStringvalue
}

// MARK: - Real instance
extension StringLocalizer {
    
    public static let real = StringLocalizer { key in NSLocalizedString(key, comment: "") }
    
}

// MARK: - Fake instance
#if DEBUG
extension StringLocalizer {
    
    public static let fake: Self = StringLocalizer { key in key }
}
#endif
