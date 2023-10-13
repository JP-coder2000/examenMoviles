//
//  GetMoviesUseCase.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//


import Foundation

/**
 * Utilizo un protocolo para hacer pruebas unitarias, 
 * como lo recomienda en el laboratorio.
 */

protocol GetListOfMoviesUseCase {
    func getListOfMovies() async -> [Result]
}

/**
 * Lo primero que hago es inicalizar mi singleton
 * Agrego el método para poder inicializar la instancia
 * Por último hago la llamada al repository
 */

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
