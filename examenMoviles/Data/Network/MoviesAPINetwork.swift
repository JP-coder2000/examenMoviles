//
//  MoviesNetworkAPIService.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation
import Alamofire

/**
 * En esta parte hago la petición con el token de acceso para poder obtener la lista de peliculas
 * me baso en el documento que tenemos en el repositorio de github: https://github.com/salgue441/Net-Zero-Citizens/blob/e7e9b2e6ac57dffbd7692298ddd16fca796624fd/ios/GreenCircle/GreenCircle/Data/Remote/Network/NetworkAPIService.swift#L140
 * Además de un poco de ayuda de la IA "PHIND" para poder utilizar el token de forma correcta.
 * Lo demás del código es lo que hemos visto en los laboratorios de clase y mi proyecto validado por la
 * profesora.
 */

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
    
