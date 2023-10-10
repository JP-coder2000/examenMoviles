//
//  examenMovilesApp.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import SwiftUI

@main
struct examenMovilesApp: App {
    @StateObject private var viewModel = MovieViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
