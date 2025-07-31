import SwiftUI
import WebKit

struct WebViewContainer: UIViewControllerRepresentable {
    let webViewManager: WebViewManager
    
    func makeUIViewController(context: Context) -> WebViewController {
        let webViewController = WebViewController()
        webViewController.webViewDelegate = webViewManager
        webViewManager.setWebViewController(webViewController)
        return webViewController
    }
    
    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
        // Updates handled by WebViewManager
    }
}

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
            Text("LOADING")
                .font(.system(size: 17))
                .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}