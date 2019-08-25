import SwiftUI

/// A specification for the appearance of a `Grid`.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol GridStyle {
    var padding: EdgeInsets { get set }
    
    func frameHeight(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGFloat?
    func frameWidth(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGFloat?
    func position(at index: Int, with geometry: GeometryProxy, itemsCount: Int) -> CGPoint
    func gridHeight(with geometry: GeometryProxy, itemsCount: Int) -> CGFloat
}

extension View {

    /// Sets the style for `Grid` within the environment of `self`.
    public func gridStyle<S>(_ style: S) -> some View where S : GridStyle {
        self.environment(\.gridStyle, style)
    }

}

struct GridStyleKey: EnvironmentKey {
    static let defaultValue: GridStyle = DefaultGridStyle()
}

extension EnvironmentValues {
    var gridStyle: GridStyle {
        get {
            return self[GridStyleKey.self]
        }
        set {
            self[GridStyleKey.self] = newValue
        }
    }
}