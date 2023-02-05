//
//  ContentView.swift
//  ChatGPT
//
//  Created by Abdullah Karaboğa on 1.02.2023.
//

import SwiftUI

struct ContentView: View {

    @State var chatMessage: [ChatMessage] = ChatMessage.sampleMessages
    @State var messageText: String = ""

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(chatMessage, id: \.id) { messageIndex in
                        messageView(message: messageIndex)
                    }
                }
            }
            HStack {
                TextField("Enter a message", text: $messageText) {

                }
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    sendMessage()

                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }

        }.padding()
    }

    func sendMessage() {
        messageText = ""
        print(messageText)
    }

    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .me { Spacer() }
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? .blue : .gray.opacity(0.2))
                .cornerRadius(16)
            if message.sender == .gpt { Spacer() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChatMessage {
    let id: String
    let content: String
    let dataCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case gpt
}

extension ChatMessage {
    static let sampleMessages = [
        ChatMessage(id: UUID().uuidString, content: "Message from me", dataCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Message from gpt", dataCreated: Date(), sender: .gpt),
        ChatMessage(id: UUID().uuidString, content: "Message from me", dataCreated: Date(), sender: .me),
        ChatMessage(id: UUID().uuidString, content: "Message from gpt", dataCreated: Date(), sender: .gpt),
    ]

}
