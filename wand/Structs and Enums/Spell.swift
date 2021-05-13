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

func getAndRunSpell (_ points: [WPoint]) throws {
    // Loading spells
    let spells = try loadSpells()
    let accuracy = 0
    var found: Spell?
    
    for spell in spells {
        // I love nested for loops
        var i = 0
        var score = 0
        for point in spell.points {
            if !comparePoint(pointA: point, pointB: points[i], accuracy: accuracy) {
                break
            }
            i += 1
        }
        if score == spell.points.count - 1 {
            print("YEP1")
            found = spell
        }
    }
}

func comparePoint (pointA: WPoint, pointB: WPoint, accuracy: Int) -> Bool {
    var xSame = false
    var ySame = false
    for i in 0...accuracy {
        if pointA.x == pointB.x {
            xSame = true
            print("accuracy: \(i)%")
        }
    }
    
    for i in 0...accuracy {
        if pointA.y == pointB.y {
            ySame = true
            print("accuracy: \(i)%")
        }
    }
    
    return xSame == ySame
}
