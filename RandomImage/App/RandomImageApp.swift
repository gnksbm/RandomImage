//
//  RandomImageApp.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct RandomImageApp: App {
    var body: some Scene {
        WindowGroup {
            RandomImageView(
                store: Store(
                    initialState: RandomImageReducer.State()
                ) {
                    RandomImageReducer()
                }
            )
        }
    }
}
