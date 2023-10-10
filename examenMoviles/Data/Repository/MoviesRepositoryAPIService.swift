//
//  MoviesRepository.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation

struct API {
    static let base = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1"
}

protocol MoviesProtocol {
    func getMovies() async -> MovieResponse?
}

class MoviesRepository: MoviesProtocol {
    let nservice: MoviesAPINetwork
    static let shared = MoviesRepository()
    
    init(nservice: MoviesAPINetwork = MoviesAPINetwork.shared) {
        self.nservice = nservice
    }
    
    func getMovies() async -> MovieResponse? {
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjhkZDc1NmUzMmI4YWNlZjYyZmQ2YzMwZmQwY2NmOSIsInN1YiI6IjY0ZWI5MzhiZTg5NGE2MDEzYmIxNjNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6cGDTI8wql15qnVZErrd_6QRNaiRAi74pRD0LfOzVZM"
        ]
        var request = URLRequest(url: URL(string: API.base)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return await nservice.getMovies(url: request.url!)
    }
}
