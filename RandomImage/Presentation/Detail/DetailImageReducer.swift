//
//  DetailImageReducer.swift
//  RandomImage
//
//  Created by gnksbm on 9/8/24.
//

import Foundation
import ComposableArchitecture

struct DetailImageReducer: Reducer {
    struct State: Equatable {
        var url: URL?
    }
    
    enum Action { 
        case dismiss
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}
