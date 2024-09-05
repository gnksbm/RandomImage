//
//  RandomImageView.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI
import ComposableArchitecture

struct RandomImageView: View {
    @StateObject private var viewModel = RandomImageViewModel()
    
    var body: some View {
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
                    ForEach(viewModel.state.sections) { section in
                        sectionView(section: section)
                    }
                }
            }
        }
        .padding()
    }
    
    func sectionView(section: ImageSection) -> some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(section.urls, id: \.self) { url in
                        CustomAsyncImage(url: url) {
                            ProgressView()
                        }
                        .frame(
                            width: viewModel.state.width,
                            height: viewModel.state.height
                        )
                        .background(.tertiary)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 25)
                        )
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
    RandomImageView()
        .environmentObject(NetworkService())
}
