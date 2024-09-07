//
//  RandomImageReducer.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI
import ComposableArchitecture

struct RandomImageReducer: Reducer {
    struct State: Equatable {
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
        case imageTapped(URL?)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}
