//
//  DetailView.swift
//  MovieList
//
//  Created by Başak on 22.08.2023.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment:.leading, spacing:5){
            HStack{
                Spacer()
                SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            
            Text(movieDetailViewModel.movieDetail?.title ?? "Film Ismi Gösterilecek").font(.title).foregroundColor(.blue).padding()
            
            Text(movieDetailViewModel.movieDetail?.plot ?? "Film Plotu Gösterilecek").padding()
            
            Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "Yönetmen Gösterilecek")").padding()
            
            Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "Yazar Gösterilecek")").padding()
            
            Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "Ödüller Gösterilecek")").padding()
            
            Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "Yıl Gösterilecek")").padding()
            
            Spacer()
            
        }.onAppear(perform: {
            self.movieDetailViewModel.MovieDetailResponse(imdbId: imdbId)
        })
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
