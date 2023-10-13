//
//  MoviesRepository.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation

/**
 * Creo la estructura primaria para poder hacer la llamada a la API
 * 
 */

struct API {
    static let base = "https://api.themoviedb.org/3"
}

/**
 * Defino un protocolo para obtener la lista de peliculas
 */

protocol MoviesProtocol {
    func getListMovies() async ->[Result]?
}

/**
 * En esta parte hago la implementación de el repositorio de películas 
 * que utiliza el protocolo 'MoviesProtocol'.
 */

class MoviesRepository: MoviesProtocol {
    let nservice: MoviesAPINetwork
    
    static let shared = MoviesRepository()
    
    init(nservice: MoviesAPINetwork = MoviesAPINetwork.shared) {
        self.nservice = nservice
    }
    
    func getListMovies() async -> [Result]? {
        return await nservice.getListMovies()
    }
}
