import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies = [Movie]()
    private var useCase: MoviesUseCaseProtocol
    
    init(useCase: MoviesUseCaseProtocol = MoviesUseCase()) {
        self.useCase = useCase
    }
    
    func fetchMovies() async {
        if let movieResponse = await useCase.getMovies() {
            movies = movieResponse.results
        }
    }
}
