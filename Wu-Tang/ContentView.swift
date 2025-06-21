//
//  ContentView.swift
//  Wu-Tang
//
//  Created by Tushar Munge on 6/20/25.
//

import SwiftUI

struct ContentView: View {
    private let firstColumn = [
        "Algorithmic",
        "Byte",
        "Cache",
        "Debug",
        "Echo",
        "Function",
        "Git",
        "Hex",
        "Infinite",
        "Java",
        "Kernel",
        "Logic",
        "Module",
        "Node",
        "Object",
        "Pixel",
        "Query",
        "Runtime",
        "Script",
        "Token",
        "Undefined",
        "Virtual",
        "Web",
        "Xcode",
        "Yota",
        "Zero",
    ]

    private let secondColumn = [
        "$tack",
        "Processor",
        "Cipher",
        "Daemon",
        "EndPoint",
        "Framework",
        "Gateway",
        "Hub",
        "Interrupt",
        "Crash",
        "Loop",
        "Module",
        "Nexus",
        "Optimizer",
        "Protocol",
        "Queue",
        "Router",
        "Stack",
        "Thread",
        "Update",
        "Variable",
        "Widget",
        "Terminal",
        "Yield",
        "Zen",
        "Ace",
        "Breakpoint",
        "Root",
        "Instance",
        "Access",
        "Archive",
        "Control",
        "Justice",
    ]

    @State private var enteredName = ""
    @State private var staticCoderNameIs = "Your Wu-Tang Coder Name is:"
    @State private var wuTangName = ""
    @State private var imageName = "wu-tang"
    @FocusState private var textFieldIsFocused: Bool

    var body: some View {
        VStack {
            Text("Wu-Tang\nCode Name Generator")
                .font(.title)
                .fontWeight(.black)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
                .padding([.horizontal, .bottom])
                .frame(maxWidth: .infinity)
                .background(.black)

            Spacer()

            TextField("Enter name here", text: $enteredName)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
                .overlay {
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(.gray, lineWidth: 2.0)
                }
                .padding()
                .focused($textFieldIsFocused)
                // When the entered name (TextField) is in focus
                // hide the image, and reset all strings
                .onChange(of: textFieldIsFocused) {
                    if textFieldIsFocused {
                        imageName = ""
                        enteredName = ""
                        staticCoderNameIs = ""
                        wuTangName = ""
                    }
                }

            Button {
                textFieldIsFocused = false
                staticCoderNameIs = "Your Wu-Tang Coder Name is:"
                imageName = "wu-tang"
                
                wuTangName = getWuTangName(from: enteredName)
            } label: {
                Image("wu-tang-button")
                Text("Get It!")
            }
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.yellow)
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .disabled(enteredName.isEmpty)

            VStack {
                Text(staticCoderNameIs)
                Text(wuTangName)
                    .fontWeight(.black)
            }
            .font(.largeTitle)
            .frame(height: 130)

            Spacer()

            Image(imageName)
                .resizable()
                .scaledToFit()
        }
        .onAppear() {
            textFieldIsFocused = false
            staticCoderNameIs = ""
        }
    }

    func getWuTangName(from enteredName: String) -> String {
        // Return an emptry string, if entered name is Blank
        guard !enteredName.isEmpty else {
            return ""
        }
        
        // Get the first letter of the entered name
        let firstLetter = enteredName.first?.uppercased() ?? ""

        // If name starts with 'A', only then choose a name that starts
        // with 'Z', otherwise, choose a name that starts with the previous
        // alphabet in the letter. 'A' -> 'Z', 'J' -> 'I'...
        let nextletter =
            firstLetter == "A"
            ? "Z"
            : String(UnicodeScalar(UnicodeScalar(firstLetter)!.value - 1)!)

        // Filter out names that don't start with 'nextLetter', so that we
        // are let with a name starting with 'nextLetter'. Use joined() to
        // get rid of '[' and ']' around the result
        let staticCoderFirstNameIs = firstColumn.filter {
            $0.hasPrefix(nextletter)
        }.joined(separator: "")

        let staticCoderLastNameIs = secondColumn.randomElement() ?? ""

        let staticCoderNameIs =
            "\(staticCoderFirstNameIs) \(staticCoderLastNameIs)!"

        print("Static Coder First Name: \(staticCoderFirstNameIs)")
        return staticCoderNameIs
    }
}

#Preview {
    ContentView()
}
