//
//  DetailView.swift
//  MovieList
//
//  Created by Başak on 22.08.2023.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId: String
       
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    @State private var isPopupVisible = false
    @State private var isSelectImage = false
    
       
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Spacer()
                SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                    .onTapGesture {
                        isSelectImage = true
                        isPopupVisible.toggle()
                        
                        
                    }
                Spacer()
            }
            
            Text(movieDetailViewModel.movieDetail?.title ?? "Film Ismi Gösterilecek")
                .font(.title)
                .foregroundColor(.blue)
                .padding()
            
            Text(movieDetailViewModel.movieDetail?.plot ?? "Film Plotu Gösterilecek")
                .padding()
                .onTapGesture {
                    isSelectImage = false
                    isPopupVisible.toggle()
                }
            
            Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "Yönetmen Gösterilecek")").padding()
            
            Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "Yazar Gösterilecek")").padding()
            
            Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "Ödüller Gösterilecek")").padding()
            
            Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "Yıl Gösterilecek")").padding()
            
            Spacer()
        }
        .onAppear(perform: {
            self.movieDetailViewModel.MovieDetailResponse(imdbId: imdbId)
        })
        .sheet(isPresented: $isPopupVisible) {
            if isSelectImage{
                PopUpView(content: "", isPresented: $isPopupVisible, image: movieDetailViewModel.movieDetail?.poster ?? "")
                
                
            }else{
                PopUpView(content: movieDetailViewModel.movieDetail?.plot ?? "", isPresented: $isPopupVisible, image: "")
            }
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}

