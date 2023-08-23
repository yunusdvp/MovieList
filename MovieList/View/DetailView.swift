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
    @State var isSelectImage = false
    
       
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                Spacer()
                SpecialImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.4, alignment: .center)
                    .onTapGesture {
                        isSelectImage = true
                        isPopupVisible.toggle()
                        
                        
                    }
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 1){
                Text(movieDetailViewModel.movieDetail?.title ?? "Film Ismi Gösterilecek")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.bottom, 5)
                
                Text(movieDetailViewModel.movieDetail?.plot ?? "Film Plotu Gösterilecek")
                    .padding()
                    .onTapGesture {
                        isSelectImage = false
                        isPopupVisible.toggle()
                    }.frame(width: UIScreen.main.bounds.width,alignment: .leading).border(Color.blue,width: 2).cornerRadius(6).background(Color.indigo)
                
                Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "Yönetmen Gösterilecek")").padding().frame(width: UIScreen.main.bounds.width,alignment: .leading).border(Color.blue,width: 2).cornerRadius(6).background(Color.indigo)
                
                
                Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "Yazar Gösterilecek")").padding().frame(width: UIScreen.main.bounds.width,alignment: .leading).border(Color.blue,width: 2).cornerRadius(6).background(Color.indigo)
                
                Text("Awards: \(movieDetailViewModel.movieDetail?.awards ?? "Ödüller Gösterilecek")").padding().frame(width: UIScreen.main.bounds.width,alignment: .leading).border(Color.blue,width: 2).cornerRadius(6).background(Color.indigo)
                
                Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "Yıl Gösterilecek")").padding().frame(width: UIScreen.main.bounds.width,alignment: .leading).border(Color.blue,width: 2).cornerRadius(6).background(Color.indigo)
                
            }
            
            
            
            
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

