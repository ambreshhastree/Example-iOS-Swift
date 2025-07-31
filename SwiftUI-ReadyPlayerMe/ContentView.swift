import SwiftUI

struct ContentView: View {
    @StateObject private var webViewManager = WebViewManager()
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = "Event Received"
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("Ready Player Me")
                    .font(.title2)
                    .foregroundColor(.primary)
                
                Spacer()
                
                VStack(spacing: 15) {
                    Button(action: {
                        webViewManager.createNewAvatar()
                    }) {
                        Text("Create Your Avatar")
                            .foregroundColor(.white)
                            .frame(width: 180, height: 51)
                            .background(Color.primary)
                            .cornerRadius(8)
                    }
                    
                    if webViewManager.hasCookies {
                        Button(action: {
                            webViewManager.editAvatar()
                        }) {
                            Text("Update Avatar")
                                .foregroundColor(.white)
                                .frame(width: 180, height: 51)
                                .background(Color.primary)
                                .cornerRadius(8)
                        }
                    }
                }
                
                Spacer()
            }
            
            if webViewManager.isWebViewVisible {
                WebViewContainer(webViewManager: webViewManager)
                    .ignoresSafeArea()
            }
        }
        .onReceive(webViewManager.$eventMessage) { message in
            if !message.isEmpty {
                alertMessage = message
                showingAlert = true
            }
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    ContentView()
}