import Testing
@testable import RidgeviewCore

struct DeviceTypeTests {
    
    @Test
    func deviceTypeModelNames() {
        #expect(Device.modelName(forIdentifier: "iPod9,1") == "iPod touch (7th generation)")
        
        #expect(Device.modelName(forIdentifier: "iPhone17,3") == "iPhone 16")
        #expect(Device.modelName(forIdentifier: "iPhone17,4") == "iPhone 16 Plus")
        #expect(Device.modelName(forIdentifier: "iPhone17,1") == "iPhone 16 Pro")
        #expect(Device.modelName(forIdentifier: "iPhone17,2") == "iPhone 16 Pro Max")
        
        #expect(Device.modelName(forIdentifier: "iPad14,6") == "iPad Pro (12.9-inch) (6th generation)")
    }
}
