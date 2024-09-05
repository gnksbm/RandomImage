//
//  ViewModelType.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import Foundation

protocol ViewModelType: ObservableObject {
    var state: State { get }
    
    associatedtype State
    associatedtype Action
    
    func reduce(action: Action)
}
