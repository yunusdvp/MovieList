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
    
    @State var searchedMovie = ""
    
    
    init(){
        self.MovieListViewModel = MovieList.MovieListViewModel()
    }
    
    var body: some View{
        NavigationView{
            
            VStack {
        
                TextField("Aranacak Film", text: $searchedMovie)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .onChange(of: searchedMovie) { newSearchValue in
                        if newSearchValue.count >= 2 {
                            MovieListViewModel.searchMovie(movieName: newSearchValue.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? newSearchValue)
                        }
                    }



            
        List(MovieListViewModel.movies, id: \.imdbId) { movie in
            NavigationLink(
                destination: DetailView(imdbId: movie.imdbId),
                label: {
                    HStack() {
                        
                        SpecialImage(url: movie.poster)
                            .frame(width: 90, height:130)
                        
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.title3)
                                .foregroundColor(.blue)
                                
                            
                            Text(movie.year)
                                .foregroundColor(.orange)
                        }
                    }
                })
          
            
        }.navigationTitle(Text("Movie Book"))
        }
        }
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
 
