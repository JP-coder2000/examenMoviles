//
//  MoviesNetworkAPIService.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation
import Alamofire


class MoviesAPINetwork {
    static let shared = MoviesAPINetwork()

    private let tokenAcceso = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjhkZDc1NmUzMmI4YWNlZjYyZmQ2YzMwZmQwY2NmOSIsInN1YiI6IjY0ZWI5MzhiZTg5NGE2MDEzYmIxNjNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6cGDTI8wql15qnVZErrd_6QRNaiRAi74pRD0LfOzVZM"

    func getListMovies() async -> [Result]? {
      
      
        let url = "\(API.base)/discover/movie?include_video=false&sort_by=popularity.desc"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(tokenAcceso)",
            "Accept": "application/json"
        ]

        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        let response = await taskRequest.serializingData().response
        
      switch response.result {
      case .success(let data):
          do {
              let response = try JSONDecoder().decode(Response.self, from: data)
              return response.results
          } catch {
              return nil
          }
      case let .failure(error):
          debugPrint(error.localizedDescription)
          return nil
      }
    }
}
    
