//
//  CourseObjectModel.swift
//  180520221301
//
//  Created by Сережа Хазов on 18.05.2022.
//

import SwiftUI

struct FilmModel: Identifiable {
    let id = UUID()
    let filmName: String
    let aboutFilm: String
    let image: String
}
