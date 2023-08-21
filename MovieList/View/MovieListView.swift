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
    
    var body: some View{
        List(MovieListViewModel.movies, id: \.imdbId){
            movie in
            HStack{
                Image("placeholder2.png")
                    .frame(width: 100, height: 150)
                
                VStack{
                    Text(movie.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
