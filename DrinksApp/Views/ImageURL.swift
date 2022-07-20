import Foundation
import SwiftUI

struct ImageURL: View {
    
    @StateObject private var imageLoader = ImageLoader()
    let url: URL?
    
    var body: some View {
        VStack {
            if let uiImage = imageLoader.uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 80)
            } else {
                ProgressView()
            }
        }.task {
            await downloadImage()
        }
    }
    
    private func downloadImage() async {
        do {
            try await imageLoader.fetchImage(url)
        } catch {
            print(error)
        }
    }
}
