import Foundation

protocol MoviesUseCaseProtocol {
    func getMovies() async -> MovieResponse?
}

class MoviesUseCase: MoviesUseCaseProtocol {
    let repository: MoviesRepository
    
    init(repository: MoviesRepository = MoviesRepository.shared) {
        self.repository = repository
    }
    
    func getMovies() async -> MovieResponse? {
        return await repository.getMovies()
    }
}
