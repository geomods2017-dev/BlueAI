import SwiftUI
import UIKit

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 4/255, green: 10/255, blue: 20/255, alpha: 1.0)

        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.55)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white.withAlphaComponent(0.55)
        ]

        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 0.18, green: 0.64, blue: 1.0, alpha: 1.0)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.18, green: 0.64, blue: 1.0, alpha: 1.0)
        ]

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            AssistantView()
                .tabItem {
                    Label("Assistant", systemImage: "sparkles")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .preferredColorScheme(.dark)
    }
}
