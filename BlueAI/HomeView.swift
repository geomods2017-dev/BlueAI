import SwiftUI

struct HomeView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    headerCard
                    statusCard
                    modulesSection
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                .padding(.bottom, 28)
            }
            .background(BlueAITheme.appBackground.ignoresSafeArea())
            .navigationTitle("BlueAI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                ZStack {
                    Circle()
                        .fill(BlueAITheme.accentSoft)
                        .frame(width: 56, height: 56)

                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(BlueAITheme.accent)
                }

                Spacer()
            }

            Text("BlueAI Assistant")
                .font(.title2.bold())
                .foregroundStyle(BlueAITheme.primaryText)

            Text("A futuristic AI command center built for quick access, smart responses, and clean interaction.")
                .font(.subheadline)
                .foregroundStyle(BlueAITheme.secondaryText)
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(BlueAITheme.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(BlueAITheme.cardBorder, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }

    private var statusCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("System Status")
                .font(.headline)
                .foregroundStyle(BlueAITheme.primaryText)

            HStack(spacing: 10) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 10, height: 10)

                Text("Core online")
                    .foregroundStyle(BlueAITheme.secondaryText)

                Spacer()

                Text("v1 Prototype")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(BlueAITheme.accent)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(BlueAITheme.accentSoft)
                    .clipShape(Capsule())
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(BlueAITheme.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(BlueAITheme.cardBorder, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }

    private var modulesSection: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            moduleCard(title: "Assistant", icon: "sparkles", subtitle: "Chat and responses")
            moduleCard(title: "Voice", icon: "waveform", subtitle: "Coming soon")
            moduleCard(title: "Memory", icon: "internaldrive", subtitle: "Saved context")
            moduleCard(title: "Tools", icon: "slider.horizontal.3", subtitle: "Actions and tasks")
        }
    }

    private func moduleCard(title: String, icon: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(BlueAITheme.accent)

            Spacer(minLength: 8)

            Text(title)
                .font(.headline)
                .foregroundStyle(BlueAITheme.primaryText)

            Text(subtitle)
                .font(.caption)
                .foregroundStyle(BlueAITheme.secondaryText)
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 130, alignment: .leading)
        .background(BlueAITheme.cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(BlueAITheme.cardBorder, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
