import SwiftUI
import MapKit

// Map Wrapper
struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String

    @State private var region: MKCoordinateRegion

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        _region = State(initialValue: MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: false, userTrackingMode: nil, annotationItems: [SimpleMapAnnotation(coordinate: coordinate, title: title, subtitle: subtitle)]) { annotation in
            MapMarker(coordinate: annotation.coordinate, tint: .red)
        }
        .cornerRadius(10)
    }
}

struct SimpleMapAnnotation: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
}
