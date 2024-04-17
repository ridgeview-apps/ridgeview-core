import SwiftUI

extension Binding {
    func debug(_ prefix: String) -> Binding {
        Binding(
            get: {
                print("\(prefix): getting \(self.wrappedValue)")
                return self.wrappedValue
        },
            set: {
                print("\(prefix): setting \(self.wrappedValue) to \($0)")
                self.wrappedValue = $0
        })
    }
}

extension View {
    
    public func onSceneDidBecomeActive(action: @escaping () -> ()) -> some View {
        modifier(OnChangeOfScenePhaseModifier(to: .active, action: action))
    }
    
    public func onSceneDidBecomeInactive(action: @escaping () -> ()) -> some View {
        modifier(OnChangeOfScenePhaseModifier(to: .inactive, action: action))
    }
    
    public func onSceneDidEnterBackground(action: @escaping () -> ()) -> some View {
        modifier(OnChangeOfScenePhaseModifier(to: .background, action: action))
    }
    
}

struct OnChangeOfScenePhaseModifier: ViewModifier {
    @Environment(\.scenePhase) private var scenePhase
    
    public let to: ScenePhase
    
    public let action: () -> ()
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: scenePhase) { newPhase in
                if (newPhase == to) {
                    action()
                }
            }
    }
}
