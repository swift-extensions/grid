import SwiftUI

/// Staggered `Grid` style.
public struct ModularGridStyle: GridStyle {
    let columns: Tracks
    let rows: Tracks
    let spacing: CGFloat
    public let padding: EdgeInsets
        
    public init(columns: Tracks, rows: Tracks, spacing: CGFloat = 8, padding: EdgeInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)) {
        self.columns = columns
        self.rows = rows
        self.spacing = spacing
        self.padding = padding
    }
        
    public func itemPreferences(with geometry: GeometryProxy, itemsCount: Int, preferences: [GridItemPreferences]) -> [GridItemPreferences] {
        let computedTracksCount = tracksCount(
            tracks: self.columns,
            spacing: self.spacing,
            padding: self.padding.leading + self.padding.trailing,
            availableLength: geometry.size.width
        )
        
        let size = CGSize(
            width: itemLength(
                tracks: self.columns,
                spacing: self.spacing,
                padding: self.padding.leading + self.padding.trailing,
                availableLength: geometry.size.width
            ),
            height: itemLength(
                tracks: self.rows,
                spacing: self.spacing,
                padding: self.padding.top + self.padding.bottom,
                availableLength: geometry.size.height
            )
        )
        
        return gridAlignmentGuides(
            tracks: computedTracksCount,
            spacing: self.spacing,
            axis: .vertical,
            size: size,
            viewsCount: itemsCount,
            geometry: geometry,
            preferences: preferences
        )
    }
}
