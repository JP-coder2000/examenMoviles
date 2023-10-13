//
//  ContentView.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//



/**
* En esta parte despliego la vista principal de la aplicación, en la cual se muestra la lista de películas
* que se obtienen de la API de The Movie Database.
*/

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.moviesArray, id: \.id) { movie in
                    HStack(spacing: 16) {
                        // AsyncImage para cargar la imagen de la película desde la URL
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // Muestra una vista de progreso mientras se carga la imagen
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                            case .failure:
                                Image(systemName: "photo") // Muestra una imagen de reemplazo en caso de error al cargar la imagen
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        // VStack para mostrar los datos de la película
                        VStack(alignment: .leading, spacing: 30) {
                            // Título de la película
                            Text(movie.title)
                                .foregroundColor(.black)
                                .font(.title)
                                .bold()
                                .padding(.trailing, 50)
                            
                            // Fecha de lanzamiento de la película
                            Text("Release Date: \(movie.release_date)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            // Popularidad de la película
                            Text("Popularity: \(movie.popularity)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            // Calificación de la película
                            Text("Rating: \(movie.vote_average)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            // Resumen de la película
                            Text("Overview:")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            Text(movie.overview)
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .padding(16)
                    }
                    .padding(.horizontal, 20)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.vertical, 20)
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 24)
        }
        .onAppear {
            Task {
                await viewModel.fetch() // Llama a la función fetch() del viewModel para obtener la lista de películas
            }
        }
        .navigationTitle("Películas de JP") // Título de la vista
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
