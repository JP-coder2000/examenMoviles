//
//  MovieModels.swift
//  examenMoviles
//
//  Created by Juan Pablo Cabrera on 10/10/23.
//

import Foundation

/**
 * Me baso en lo que me dice la página de internet
 * https://quicktype.io/ para poder hacer el modelo.
 */
struct Result: Codable {
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
}

/**
 * Modelo para la lista de peliculas
 * 
 */

struct Response: Decodable {
    let page: Int
    let results: [Result]
    let total_pages: Int
    let total_results: Int
}
