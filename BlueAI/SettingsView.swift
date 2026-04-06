import SwiftUI

struct SettingsView: View {
    @AppStorage("blueai_voice_enabled") private var voiceEnabled: Bool = false
    @AppStorage("blueai_memory_enabled") private var memoryEnabled: Bool = true
    @AppStorage("blueai_boot_message") private var bootMessage: String = "BlueAI online."

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    settingsCard
                    systemCard
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                .padding(.bottom, 28)
            }
            .background(BlueAITheme.appBackground.ignoresSafeArea())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var settingsCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Core Settings")
                .font(.headline)
                .foregroundStyle(BlueAITheme.primaryText)

            Toggle("Enable voice features", isOn: $voiceEnabled)
                .tint(BlueAITheme.accent)
                .foregroundStyle(BlueAITheme.primaryText)

            Toggle("Enable memory", isOn: $memoryEnabled)
                .tint(BlueAITheme.accent)
                .foregroundStyle(BlueAITheme.primaryText)

            VStack(alignment: .leading, spacing: 8) {
                Text("Boot message")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(BlueAITheme.secondaryText)

                TextField("Boot message", text: $bootMessage)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .background(Color.white.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(BlueAITheme.cardBorder, lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(BlueAITheme.primaryText)
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

    private var systemCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About")
                .font(.headline)
                .foregroundStyle(BlueAITheme.primaryText)

            Text("BlueAI is a SwiftUI-based assistant prototype designed with a futuristic interface and staged AI expansion in mind.")
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
}
