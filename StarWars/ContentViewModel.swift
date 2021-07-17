//
//  ContentViewModel.swift
//  StarWars
//
//  Created by Martin Mitrevski on 14.7.21.
//

import Combine
import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var entries = [Entry(title: "Show five different people with their eye color",
                                    entryType: .people),
                              Entry(title: "Show five planets with their population and climate",
                                    entryType: .planets),
                              Entry(title: "Show all films",
                                    entryType: .films)]
    
}

struct Entry: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let entryType: EntryType
}

enum EntryType {
    case people
    case planets
    case films
}
