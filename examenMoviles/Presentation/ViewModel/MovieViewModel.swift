//
//  MovieViewModel.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation

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
