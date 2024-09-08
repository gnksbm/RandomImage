//
//  RandomImageView.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI
import ComposableArchitecture

struct RandomImageView: View {
    @ComposableArchitecture.Bindable var store: StoreOf<RandomImageReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            CustomNavigationView {
                ScrollView {
                    Text("My Random Image")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    LazyVStack(
                        alignment: .leading,
                        pinnedViews: [.sectionHeaders]
                    ) {
                        ForEach(viewStore.state.sections) { section in
                            sectionView(
                                section: section,
                                size: CGSize(
                                    width: viewStore.state.width,
                                    height: viewStore.state.height
                                )
                            ) { url in
                                viewStore.send(.imageTapped(url))
                            }
                        }
                    }
                }
                .navigationDestination(
                    item: $store.scope(
                        state: \.detailImage,
                        action: \.detailImage
                    )
                ) { store in
                    DetailImageView(store: store)
                }
            }
            .padding()
        }
    }
    
    func sectionView(
        section: ImageSection,
        size: CGSize,
        action: @escaping (URL?) -> Void
    ) -> some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(section.urls, id: \.self) { url in
                        Button {
                            action(url)
                        } label: {
                            CustomAsyncImage(url: url) {
                                ProgressView()
                            }
                            .frame(
                                width: size.width,
                                height: size.height
                            )
                            .background(.tertiary)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 25)
                            )
                        }
                    }
                }
            }
        } header: {
            Text(section.title)
                .font(.title)
                .padding(.vertical)
        }
    }
}

#Preview {
    RandomImageView(
        store: Store(
            initialState: RandomImageReducer.State()
        ) {
            RandomImageReducer()
        }
    )
    .environmentObject(NetworkService())
}
