import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.moviesArray, id: \.id) { movie in
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)")!) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 30) {
                            Text(movie.title)
                                .foregroundColor(.black)
                                .font(.title)
                                .bold()
                                .padding(.trailing, 50)
                            
                            Text("Release Date: \(movie.release_date)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            Text("Popularity: \(movie.popularity)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            Text("Rating: \(movie.vote_average)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            Text("Overview:")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            
                            Text(movie.overview)
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .padding(16)
                    }
                    .padding(.horizontal, 20)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.vertical, 20)
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 24)
        }
        .onAppear {
            Task {
                await viewModel.fetch()
            }
        }
        .navigationTitle("Películas de JP")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

