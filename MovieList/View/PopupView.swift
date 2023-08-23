//
//  PopupView.swift
//  MovieList
//
//  Created by Yunus Emre ÖZŞAHİN on 22.08.2023.
//

import SwiftUI

struct PopUpView: View {
    let content: String
    @Binding var isPresented: Bool
    let image: String
    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                Text(content)
                    .padding()
                SpecialImage(url: image)
                    .frame(alignment: .center)
            }
            //.frame(maxHeight: UIScreen.main.bounds.height * 0.5)
            .background(Color.white)
            .cornerRadius(10)
            .padding()
            Spacer()
        }
        //.frame(width: UIScreen.main.bounds.width * 0.8)
        .background(Color.gray.opacity(0.1))
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            isPresented.toggle()
        }
    }
}

