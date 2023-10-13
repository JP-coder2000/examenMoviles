//
//  MovieViewModel.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation

/**
 * Creo la lógica que voy a utilizar en la vista
 * Pongo que la variable de moviesArray sea @Published para que cuando se actualice, 
 * tambien se actialice la vista
 * Al final tengo mi función asincornica que es la que se va a encargar de obtener y actualizar la lista de peliculas
 */

@MainActor
class MovieViewModel: ObservableObject {
    @Published var moviesArray = [Result]()
    
    private let getListOfMoviesUseCase: GetListOfMoviesUseCase

    init(getListOfMoviesUseCase: GetListOfMoviesUseCase = GetListOfMoviesUseCaseImpl()) {
        self.getListOfMoviesUseCase = getListOfMoviesUseCase
    }

    func fetch() async {
        moviesArray = await getListOfMoviesUseCase.getListOfMovies()
    }
}
