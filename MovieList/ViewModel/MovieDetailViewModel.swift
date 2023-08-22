//
//  MovieDetailViewModel.swift
//  MovieList
//
//  Created by Yunus Emre ÖZŞAHİN on 22.08.2023.
//

import Foundation


class MovieDetailViewModel : ObservableObject{
    @Published var movieDetail : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func MovieDetailResponse(imdbId : String) {
        
        downloaderClient.movieDetailDownload(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieDetails):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel(detail: movieDetails)
                }
                
            }
        }
        
    }
}
struct MovieDetailsViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
    
}

