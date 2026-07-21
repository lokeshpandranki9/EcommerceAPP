//
//  AppCoordinatorView.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

// Coordinator/AppCoordinatorView.swift
import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator: Coordinator

    init(container: AppContainer) {
        _coordinator = StateObject(wrappedValue: Coordinator(container: container))
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.showProductList()
                .navigationDestination(for: Route.self) { route in
                    coordinator.destination(for: route)
                }
        }
        .environmentObject(coordinator)
    }
}
