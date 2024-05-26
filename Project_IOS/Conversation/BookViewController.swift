// MARK: - Фуреева Анастасия
import SwiftUI
import EpubReaderLight

struct BookReaderView: View {
    @StateObject private var readerViewController = EpubReaderLight.ReaderViewController(theme: .light)

    var body: some View {
        ReaderView(controller: readerViewController)
            .onAppear {
                Task {
                    do {
                        guard let urlBook = Bundle.main.url(forResource: "Geyko Yuriy. Avtolikbez - BooksCafe.Net", withExtension: "epub") else {
                            fatalError("EPUB file not found in bundle")
                        }
                        try await readerViewController.loadBook(url: urlBook)
                    } catch {
                        print("Error loading book: \(error)")
                    }
                }
            }
    }
}
