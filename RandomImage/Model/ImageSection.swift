//
//  ImageSection.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import Foundation

struct ImageSection: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let urls: [URL?] = (0...20).map { _ in
        URL(string: "https://picsum.photos/id/\(Int.random(in: 0...999))/200/300")
    }
}
