//
//  Appetizer.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 22/09/23.
//

import Foundation

class AppetizerModel : ObservableObject, Codable, Identifiable  {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    @Published var qtd: Int = 0
    
    init(appetizer: Appetizer){
        self.id = appetizer.id
        self.name = appetizer.name
        self.description = appetizer.description
        self.price = appetizer.price
        self.imageURL = appetizer.imageURL
        self.calories = appetizer.calories
        self.protein = appetizer.protein
        self.carbs = appetizer.carbs
    }
    
    init(id: Int, name: String, description: String, price: Double, imageURL: String, calories: Int, protein: Int, carbs: Int, qtd: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
        self.qtd = qtd
    }
    
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case description
        case price
        case imageURL
        case calories
        case protein
        case carbs
        case qtd
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.price = try container.decode(Double.self, forKey: .price)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.calories = try container.decode(Int.self, forKey: .calories)
        self.protein = try container.decode(Int.self, forKey: .protein)
        self.carbs = try container.decode(Int.self, forKey: .carbs)
        self.qtd = try container.decode(Int.self, forKey: .qtd)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(price, forKey: .price)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(calories, forKey: .calories)
        try container.encode(protein, forKey: .protein)
        try container.encode(carbs, forKey: .carbs)
        try container.encode(qtd, forKey: .qtd)
    }
    
    func increment() {
        qtd = qtd + 1;
    }
    
    func decrement() {
        if qtd > 0 {
            qtd = qtd - 1;
        }
    }
    
}

struct Appetizer : Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}


struct MockData {
    
    
    static let sampleAppetizer = AppetizerModel(appetizer:  Appetizer(id: 0001,
                                                                      name: "Test Appetizer",
                                                                      description: "This is the description for my appetizer. It's yummy.",
                                                                      price: 9.99,
                                                                      imageURL: "asian-flank-steak",
                                                                      calories: 99,
                                                                      protein: 99,
                                                                      carbs: 99))
    
    static let appetizers = [sampleAppetizer,sampleAppetizer, sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001, name: "Test Appetizer 0001", description: "It's just a test item", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let orderItemTwo = Appetizer(id: 0002, name: "Test Appetizer 0002", description: "It's just a test item", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let orderItemThree = Appetizer(id: 0003, name: "Test Appetizer 0003", description: "It's just a test item", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
