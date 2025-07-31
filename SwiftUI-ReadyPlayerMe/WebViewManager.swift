import SwiftUI
import Combine

class WebViewManager: ObservableObject, WebViewDelegate {
    @Published var isWebViewVisible = false
    @Published var hasCookies = false
    @Published var eventMessage = ""
    
    private var webViewController: WebViewController?
    
    init() {
        checkForCookies()
    }
    
    func setWebViewController(_ controller: WebViewController) {
        self.webViewController = controller
        checkForCookies()
    }
    
    func createNewAvatar() {
        webViewController?.reloadPage(clearHistory: true)
        isWebViewVisible = true
    }
    
    func editAvatar() {
        webViewController?.reloadPage(clearHistory: false)
        isWebViewVisible = true
    }
    
    func hideWebView() {
        isWebViewVisible = false
        checkForCookies()
    }
    
    private func checkForCookies() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hasCookies = self.webViewController?.hasCookies() ?? false
        }
    }
    
    // MARK: - WebViewDelegate
    
    func onAvatarExported(event: AvatarExportedEvent) {
        DispatchQueue.main.async {
            self.eventMessage = event.url
            self.hideWebView()
        }
    }
    
    func onAssetUnlocked(event: AssetUnlockedEvent) {
        DispatchQueue.main.async {
            self.eventMessage = "Asset \(event.assetId) unlocked for user \(event.userId)"
        }
    }
    
    func onUserSet(event: UserSetEvent) {
        DispatchQueue.main.async {
            self.eventMessage = "User set: \(event.id)"
        }
    }
    
    func onUserAuthorized(event: UserAuthorizedEvent) {
        DispatchQueue.main.async {
            self.eventMessage = "User authorized: \(event.id)"
        }
    }
    
    func onUserUpdated(event: UserUpdatedEvent) {
        DispatchQueue.main.async {
            self.eventMessage = "User updated: \(event.id)"
        }
    }
    
    func onUserLoggedOut() {
        DispatchQueue.main.async {
            self.eventMessage = "Logged out."
        }
    }
}