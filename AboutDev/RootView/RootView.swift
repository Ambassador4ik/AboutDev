import MapKit
import SwiftUI

struct RootView: View {
    // MARK: States
    @State private var isTelegramSafariViewPresented = false
    @State private var isWebsiteSafariViewPresented = false
    
    // MARK: Content
    private let phone = "+12345678900"
    private let companyName = "Cool Devs"
    private let email = "steveoak@cooldevs.io"
    private let address = "123 Developer Lane, Code City"
    private let companyWebsiteURL = "https://ambassador4ik.dev"
    private let officeLocation = CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173)

    // MARK: View layout
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    title
                    developerInfo.padding(.bottom, 7)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        contactWebsite
                        contactTelegram
                        contactPhone
                        contactEmail
                    }
                }
                .padding()
            }
            Spacer()
            officeAddress
            officeMap
        }
    }
    
    // MARK: Components
    private var title: some View {
        Text("Cool Devs")
            .font(.system(size: 40, weight: .medium))
            .foregroundColor(.accentTwo)
    }
    
    private var developerInfo: some View {
        Text("Steve Oak, CEO")
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.accentTwo)
    }
    
    var contactTelegram: some View {
        ContactButton(iconName: "paperplane", label: "@coolsteve") {
            self.isTelegramSafariViewPresented.toggle()
        }
        .sheet(isPresented: $isTelegramSafariViewPresented) {
            SafariView(url: URL(string: "https://t.me/coolsteve")!).ignoresSafeArea(.all)
        }
    }
        
    var contactWebsite: some View {
        ContactButton(iconName: "network", label: "cooldevs.io") {
            self.isWebsiteSafariViewPresented.toggle()
        }
        .sheet(isPresented: $isWebsiteSafariViewPresented) {
            SafariView(url: URL(string: companyWebsiteURL)!).ignoresSafeArea(.all)
        }
    }
    
    private var contactEmail: some View {
        ContactButton(iconName: "envelope", label: email) {
            UIApplication.openURLIfPossible("mailto:\(email)")
        }
    }
    
    private var contactPhone: some View {
        ContactButton(iconName: "phone", label: phone) {
            UIApplication.openURLIfPossible("tel://\(phone)")
        }
    }
    
    private var officeAddress: some View {
        Text(address)
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.accentTwo)
            .padding([.top, .leading, .trailing])
    }
    
    private var officeMap: some View {
        MapView(coordinate: officeLocation, title: companyName, subtitle: address)
            .frame(height: 300)
            .edgesIgnoringSafeArea(.bottom)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.accentTwo, lineWidth: 3))
            .padding([.bottom, .leading, .trailing])
    }
    
    private func callPhoneNumber(phoneNumber: String) {
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func sendEmail(emailAddress: String) {
        if let url = URL(string: "mailto:\(emailAddress)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
