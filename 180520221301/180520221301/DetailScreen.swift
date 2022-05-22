//
//  DetailScreen.swift
//  180520221301
//
//  Created by Сережа Хазов on 22.05.2022.
//

import SwiftUI

struct DetailScreen: View {
    
    let filmItem: FilmModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                HStack {
                    Text (filmItem.filmName)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
               
                }
                Image("\(filmItem.image)")
                    .resizable()
                    .frame(width: 350, height: 350)
                Text (filmItem.aboutFilm)
                    .padding(.top)
                
                
                Spacer()
            }
            .padding()
        }
        }
       
        
    }
