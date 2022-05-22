//
//  ContentView.swift
//  180520221301
//
//  Created by Сережа Хазов on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            List (filmArray) { film in
                
                NavigationLink(destination: DetailScreen(filmItem: film)) {
                    VStack {
                        Text (film.filmName)
                            .padding(.trailing)
                    }
                }
            }.navigationTitle("Фильмы")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






