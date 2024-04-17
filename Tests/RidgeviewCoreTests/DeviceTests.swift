import XCTest
@testable import RidgeviewCore

final class DeviceTypeTests: XCTestCase {
    
    func testDeviceTypeModelNames() {
        assertDisplayName(forIdentifier: "iPod9,1", isEqualTo: "iPod touch (7th generation)")
        
        assertDisplayName(forIdentifier: "iPhone15,4", isEqualTo: "iPhone 15")
        assertDisplayName(forIdentifier: "iPhone15,5", isEqualTo: "iPhone 15 Plus")
        assertDisplayName(forIdentifier: "iPhone16,1", isEqualTo: "iPhone 15 Pro")
        assertDisplayName(forIdentifier: "iPhone16,2", isEqualTo: "iPhone 15 Pro Max")
        
        assertDisplayName(forIdentifier: "iPad14,6", isEqualTo: "iPad Pro (12.9-inch) (6th generation)")
        
        assertDisplayName(forIdentifier: "AppleTV14,1", isEqualTo: "Apple TV 4K (3rd generation)")
        
        assertDisplayName(forIdentifier: "Watch6,15", isEqualTo: "Apple Watch Series 8 45mm")
        assertDisplayName(forIdentifier: "Watch7,5", isEqualTo: "Apple Watch Ultra2")
    }
    
    private func assertDisplayName(
        forIdentifier identifier: String,
        isEqualTo expectedValue: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertEqual(Device.mapToDevice(identifier: identifier).modelName, expectedValue, file: file, line: line)
    }
}
