import Foundation

extension Bundle {
    
    public func decodedJSON<D: Decodable>(from filename: String) -> D? {
        let includesFileExtension = (filename as NSString).pathExtension.lowercased() == "json"
        let resource = includesFileExtension ? (filename as NSString).deletingPathExtension : filename
                
        guard let url = url(forResource: resource, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let decodedValue = try? JSONDecoder().decode(D.self, from: data) else {
                return nil
        }
        
        return decodedValue
    }
    
    private enum InfoPlistKey: String {
        case bundleShortVersionString = "CFBundleShortVersionString"
        case bundleVersion = "CFBundleVersion"
        case bundleName = "CFBundleName"
        case bundleDisplayName = "CFBundleDisplayName"
    }
    
    private func infoPlistStringValue(for key: InfoPlistKey) -> String? {
        localizedInfoDictionary?[key.rawValue] as? String
            ?? infoDictionary?[key.rawValue] as? String
    }
    
    public var releaseVersionNumber: String {
        infoPlistStringValue(for: .bundleShortVersionString) ?? ""
    }

    public var buildVersionNumber: String {
        infoPlistStringValue(for: .bundleVersion) ?? ""
    }
    
    public var appVersionNumber: String {
        "\(releaseVersionNumber) (\(buildVersionNumber))"
    }
    
    public var appName: String {
        infoPlistStringValue(for: .bundleDisplayName)
            ?? infoPlistStringValue(for: .bundleName)
            ?? ""
    }
}
