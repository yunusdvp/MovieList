//
//  FilmViewModel.swift
//  MovieList
//
//  Created by Başak on 21.08.2023.
//

import Foundation
import SwiftUI

class MovieListeViewModel: ObservableObject {
    
    @Published var movies = [Movie]()
    
    let downloaderClient = DownloaderClient()
    
    func searchMovie(movieName: String) {
        downloaderClient.downloadMovie(search: movieName) { (result) in
            switch result {
                case.failure(let error):
                    print(error)
            case.success(let movieArray):
                if let movieArray = movieArray {
                    self.movies = movieArray
                }
            }
        }
    }
    
}
