import SwiftUI

struct BlueAIMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct AssistantView: View {
    @State private var inputText = ""
    @State private var messages: [BlueAIMessage] = [
        BlueAIMessage(
            text: "BlueAI online. Awaiting your command.",
            isUser: false
        )
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                orbHeader

                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            messageBubble(message)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 18)
                }

                inputBar
            }
            .background(BlueAITheme.appBackground.ignoresSafeArea())
            .navigationTitle("Assistant")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var orbHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(BlueAITheme.accentSoft)
                    .frame(width: 110, height: 110)

                Circle()
                    .stroke(BlueAITheme.accent.opacity(0.55), lineWidth: 2)
                    .frame(width: 90, height: 90)

                Image(systemName: "waveform.circle.fill")
                    .font(.system(size: 42))
                    .foregroundStyle(BlueAITheme.accent)
            }

            Text("BlueAI Core")
                .font(.title3.bold())
                .foregroundStyle(BlueAITheme.primaryText)

            Text("Text mode active")
                .font(.subheadline)
                .foregroundStyle(BlueAITheme.secondaryText)
        }
        .padding(.top, 18)
        .padding(.bottom, 8)
    }

    private func messageBubble(_ message: BlueAIMessage) -> some View {
        HStack {
            if message.isUser { Spacer(minLength: 40) }

            Text(message.text)
                .font(.body)
                .foregroundStyle(BlueAITheme.primaryText)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(message.isUser ? BlueAITheme.accent.opacity(0.28) : BlueAITheme.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(message.isUser ? BlueAITheme.accent.opacity(0.45) : BlueAITheme.cardBorder, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 18))

            if !message.isUser { Spacer(minLength: 40) }
        }
    }

    private var inputBar: some View {
        HStack(spacing: 10) {
            TextField("Enter command...", text: $inputText)
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(BlueAITheme.cardBorder, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(BlueAITheme.primaryText)

            Button(action: sendMessage) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(BlueAITheme.accent)
            }
            .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 18)
        .background(Color.black.opacity(0.12))
    }

    private func sendMessage() {
        let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        messages.append(BlueAIMessage(text: trimmed, isUser: true))
        inputText = ""

        let reply = localReply(for: trimmed)
        messages.append(BlueAIMessage(text: reply, isUser: false))
    }

    private func localReply(for text: String) -> String {
        let lower = text.lowercased()

        if lower.contains("hello") || lower.contains("hi") {
            return "Hello. BlueAI is ready."
        } else if lower.contains("status") {
            return "All primary systems appear operational."
        } else if lower.contains("name") {
            return "I am BlueAI, your prototype assistant."
        } else if lower.contains("help") {
            return "Current functions include local chat simulation, interface testing, and command shell prototyping."
        } else {
            return "Command received. Deeper intelligence features can be connected next."
        }
    }
}
