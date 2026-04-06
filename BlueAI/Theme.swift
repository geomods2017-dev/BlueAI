import SwiftUI

enum BlueAITheme {
    static let backgroundTop = Color(red: 2/255, green: 6/255, blue: 16/255)
    static let backgroundMid = Color(red: 6/255, green: 14/255, blue: 28/255)
    static let backgroundBottom = Color(red: 10/255, green: 24/255, blue: 46/255)

    static let cardBackground = Color.white.opacity(0.06)
    static let cardBorder = Color.white.opacity(0.08)

    static let primaryText = Color.white
    static let secondaryText = Color.white.opacity(0.72)
    static let mutedText = Color.white.opacity(0.48)

    static let accent = Color(red: 0.18, green: 0.64, blue: 1.00)

    static var accentSoft: Color {
        accent.opacity(0.16)
    }

    static let tabBarBackground = Color(red: 4/255, green: 10/255, blue: 20/255)

    static var appBackground: LinearGradient {
        LinearGradient(
            colors: [backgroundTop, backgroundMid, backgroundBottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
