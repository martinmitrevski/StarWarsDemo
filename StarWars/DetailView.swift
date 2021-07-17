import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            if viewModel.type == .films {
                List(viewModel.films) { film in
                    VStack(alignment: .leading) {
                        KeyValueEntry(key: "Title: ", value: film.title)
                        KeyValueEntry(key: "Opening crawl: ", value: film.openingCrawl)
                        KeyValueEntry(key: "Year: ", value: "\(film.year)")
                    }
                }
            } else if viewModel.type == .people {
                List(viewModel.eyeColorInfo) { eyeColor in
                    VStack(alignment: .leading) {
                        KeyValueEntry(key: "Person: ", value: eyeColor.name)
                        KeyValueEntry(key: "Eye color: ", value: eyeColor.color)
                    }
                }
            } else {
                List(viewModel.planets) { planet in
                    VStack(alignment: .leading) {
                        KeyValueEntry(key: "Name: ", value: planet.name)
                        KeyValueEntry(key: "Population: ", value: "\(planet.population)")
                        KeyValueEntry(key: "Climate: ", value: planet.climate)
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarTitle(viewModel.title)
    }
}

struct KeyValueEntry: View {
    let key: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(key).bold()
            Text(value)
            Spacer()
        }
    }
    
}
