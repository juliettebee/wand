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

func loadSpells () throws -> [Spell] {
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {
        let fileURLs = try FileManager.default.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil)
        var files: [Spell] = []

        for file in fileURLs {
            let file = try JSONDecoder().decode(Spell.self, from: Data(contentsOf: file))
            files.append(file)
        }
        
        return files
    } catch {
        throw error
    }
}
