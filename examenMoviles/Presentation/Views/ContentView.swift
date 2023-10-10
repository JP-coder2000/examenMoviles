//
//  ContentView.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        List(viewModel.movies) { movie in
            VStack(alignment: .leading) {
                Text(movie.title).font(.headline)
                Text(movie.overview).font(.subheadline)
                Text("Release date: \(movie.release_date)").font(.footnote)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchMovies()
            }
        }
    }
}
