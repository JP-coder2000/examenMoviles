//
//  MoviesRepository.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation

import Foundation
struct API {
    static let base = "https://api.themoviedb.org/3"
}

protocol MoviesProtocol {
    func getListMovies() async ->[Result]?
}

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
