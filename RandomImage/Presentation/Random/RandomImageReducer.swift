//
//  RandomImageReducer.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct RandomImageReducer {
    @ObservableState
    struct State: Equatable {
        @Presents var detailImage: DetailImageReducer.State?
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
        case detailImage(PresentationAction<DetailImageReducer.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .imageTapped(let url):
                state.detailImage = DetailImageReducer.State(url: url)
                return .none
            case .detailImage(.presented(.dismiss)):
                return .none
            case .detailImage:
                return .none
            }
        }
        .ifLet(\.$detailImage, action: \.detailImage) {
            DetailImageReducer()
        }
    }
}
