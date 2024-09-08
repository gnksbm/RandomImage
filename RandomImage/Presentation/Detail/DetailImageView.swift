//
//  DetailImageView.swift
//  RandomImage
//
//  Created by gnksbm on 9/8/24.
//

import SwiftUI
import ComposableArchitecture

struct DetailImageView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<DetailImageReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            CustomAsyncImage(url: viewStore.url) {
                ProgressView()
            }
        }
    }
}

#Preview {
    DetailImageView(
        store: Store(
            initialState: DetailImageReducer.State()
        ) {
            DetailImageReducer()
        }
    )
}
