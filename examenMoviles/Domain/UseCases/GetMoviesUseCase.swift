//
//  GetMoviesUseCase.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//


import Foundation

protocol GetListOfMoviesUseCase {
    func getListOfMovies() async -> [Result]
}

struct GetListOfMoviesUseCaseImpl: GetListOfMoviesUseCase {
    let moviesRepository: MoviesProtocol
    
    static let shared = GetListOfMoviesUseCaseImpl()

    init(moviesRepository: MoviesProtocol = MoviesRepository()) {
        self.moviesRepository = moviesRepository
    }

  func getListOfMovies() async -> [Result] {
      return await moviesRepository.getListMovies() ?? []
  }
}
