//
//  CustomNavigationView.swift
//  RandomImage
//
//  Created by gnksbm on 9/5/24.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    @State var navigationPath = NavigationPath()
    private let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $navigationPath) {
                content()
            }
        } else {
            NavigationView {
                content()
            }
        }
    }
}

struct CustomAsyncImage<Placeholder: View>: View {
    let url: URL?
    let placeholder: () -> Placeholder
    
    @EnvironmentObject private var networkService: NetworkService
    @State private var imageData: Data? = nil
    
    var body: some View {
        VStack {
            if let imageData,
               let uiImage = UIImage(data: imageData){
                Image(uiImage: uiImage)
            } else {
                placeholder()
            }
        }
        .task {
            do {
                imageData = try await networkService.request(url: url)
            } catch {
                dump(error)
            }
        }
    }
}
