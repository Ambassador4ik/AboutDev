import SwiftUI
import MapKit

// Utility extension for opening URLs
extension UIApplication {
    static func openURLIfPossible(_ urlString: String) {
        if let url = URL(string: urlString), shared.canOpenURL(url) {
            shared.open(url)
        }
    }
}

// Reusable ContactButton component
struct ContactButton: View {
    var iconName: String
    var label: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.medium)
                .foregroundColor(Color.accentTwo)
                .frame(minWidth: 30)
            
            Button(action: action) {
                Text(label)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.accentThree)
            }
        }
    }
}
