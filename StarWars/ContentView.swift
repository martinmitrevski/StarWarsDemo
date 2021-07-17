import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.entries) { entry in
                NavigationLink(
                    destination: DetailView(viewModel: DetailViewModel(type: entry.entryType)),
                    label: {
                        Text(entry.title)
                    })
            }
            .navigationBarTitle("Star Wars")
        }
        
    }
}
