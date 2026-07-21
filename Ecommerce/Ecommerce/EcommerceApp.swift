//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Lokesh Pandranki on 13/07/26.
//

import SwiftUI
import SwiftData

@main
struct EcommerceApp: App {
    private let container = AppContainer()

        var body: some Scene {
            WindowGroup {
                AppCoordinatorView(container: container)
            }
        }
}
