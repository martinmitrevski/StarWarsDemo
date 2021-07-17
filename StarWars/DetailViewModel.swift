import Combine
import StarWarsSDK

class DetailViewModel: ObservableObject {
    
    let type: EntryType
    
    @Published var films = [Film]()
    @Published var planets = [PlanetInfo]()
    @Published var eyeColorInfo = [EyeColorInfo]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(type: EntryType) {
        self.type = type
        self.loadData(for: type)
    }
    
    var title: String {
        switch type {
        case .films:
            return "Films"
        case .people:
            return "People"
        case .planets:
            return "Planets"
        }
    }
    
    private func loadData(for type: EntryType) {
        switch type {
        case .films:
            StarWars.shared.allFilms().sink { completion in
                print("completed loading films")
            } receiveValue: { [weak self] films in
                self?.films = films
            }
            .store(in: &cancellables)
        case .planets:
            StarWars.shared.planetInformationForFivePlanets().sink { completion in
                print("completed loading planets")
            } receiveValue: { [weak self] planets in
                self?.planets = planets
            }
            .store(in: &cancellables)
        case .people:
            StarWars.shared.eyeColorForFivePeople().sink { completion in
                print("completed loading people")
            } receiveValue: { [weak self] people in
                self?.eyeColorInfo = people
            }
            .store(in: &cancellables)
        }
    }
    
}
