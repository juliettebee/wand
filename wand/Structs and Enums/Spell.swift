//
//  Spell.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import WandKit

struct Spell : Codable {
    
    var points: [WPoint]
    var url: String
    var name = UUID.init().uuidString
    
    func save () throws {
        // Writing to file
        let save = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
        
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(self)
            try jsonData.write(to: save)
        } catch {
            throw error
        }
        
        print(save)
        print("Saved")
    }
}
