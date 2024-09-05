//
//  RandomImageViewModel.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI

final class RandomImageViewModel: ViewModelType {
    @Published var state = State()
    
    struct State {
        var sections = [
            ImageSection(title: "첫번째 섹션"),
            ImageSection(title: "두번째 섹션"),
            ImageSection(title: "세번째 섹션"),
            ImageSection(title: "네번째 섹션"),
        ]
        let width = UIScreen.main.bounds.width / 4
        var height: CGFloat { width * 3/2 }
    }
    
    enum Action {
        case itemSelected(URL?)
    }
    
    func reduce(action: Action) {
        
    }
}
