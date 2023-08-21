//
//  MovieListView.swift
//  MovieList
//
//  Created by Başak on 21.08.2023.
//

import Foundation
import SwiftUI

struct MovieListView: View {
    @ObservedObject var MovieListViewModel: MovieListViewModel
    
    init(){
        self.MovieListViewModel = MovieList.MovieListViewModel()
        self.MovieListViewModel.searchMovie(movieName: "titanic")
    }
}
