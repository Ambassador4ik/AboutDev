import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }
}

// Open links inside the application
extension View {
    func safariView(isPresented: Binding<Bool>, url: URL) -> some View {
        self.sheet(isPresented: isPresented) {
            SafariView(url: url)
                .ignoresSafeArea(.all)
        }
    }
}
