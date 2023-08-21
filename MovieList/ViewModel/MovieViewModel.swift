//
//  MovieViewModel.swift
//  MovieList
//
//  Created by Başak on 21.08.2023.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func searchMovie(movieName: String) {
        downloaderClient.downloadMovie(search: movieName) { (result) in
            switch result {
                case.failure(let error):
                    print(error)
            case.success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movies = movieArray.map(MovieViewModel.init)
                    }
                }
            }
        }
    }
    
}

struct MovieViewModel {
    
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
}
