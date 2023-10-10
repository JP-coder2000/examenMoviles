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
    
    func getMovies(url: URL) async -> MovieResponse? {
        let taskRequest = AF.request(url, method: .get).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(MovieResponse.self, from: data)
            } catch {
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
