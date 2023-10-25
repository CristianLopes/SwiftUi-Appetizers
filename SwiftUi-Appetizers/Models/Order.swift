//
//  Order.swift
//  SwiftUi-Appetizers
//
//  Created by Cristian Cris on 17/10/23.
//

import SwiftUI

final class Order : ObservableObject {
    
    @AppStorage("order") private var itemsStored: Data?
    @Published var items: [AppetizerModel] = []
    
    
    func save() {
        do {
            let data = try JSONEncoder().encode(items)
            itemsStored = data;
        } catch {
            print("Error on save order \(error)")
        }
        
    }
    
    func retrieve() {
        guard let itemsStored = itemsStored else { return }
        do {
            items = try JSONDecoder().decode([AppetizerModel].self, from: itemsStored)
        } catch {
            print("Error on retrieve order \(error)")
        }
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(appetizer: AppetizerModel){
        if let itemFounded = items.first (where: {$0.id == appetizer.id }) {
            itemFounded.increment()
        } else {
            appetizer.qtd = 1
            items.append(appetizer)
        }
        
        save()
    }
    
    func subtract(appetizer: AppetizerModel){
        if appetizer.qtd == 1 {
            items.removeAll(where: { $0.id == appetizer.id  })
        } else if let itemFounded = items.first (where: {$0.id == appetizer.id }) {
            itemFounded.decrement()
        } 
        
        save()
    }
    
    
    func remove(offset: IndexSet) {
        items.remove(atOffsets: offset)
        save()
    }
    
    func placeOrder() {
        items.removeAll()
        save()
    }
}
