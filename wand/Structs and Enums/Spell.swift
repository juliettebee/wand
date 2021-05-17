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
    let spells = try loadSpells()
    var found: Spell?
    let maxScore = 30
    var same = false
    
    // How spells are found:
    // Loop over all the spells
    // Loop over all points in the spell
    // Compare points, adding a score until they're the same
    // If the score is less than the max score set same to yes
    // If it's not, unset same
    
    // 🍝
    for spell in spells {
        print("spell")
        var index = 0
        for point in spell.points {
            if index >= spell.points.count - 1 || index >= points.count - 1 {
                continue
            }
            
            index = index + 1
            
            var i = 0
            while i < maxScore {
                // I don't think i've included enough nested loops tbh
                print(i)
                var doneX = false
                var doneY = false
                
                if point.x == points[index].x + i {
                    doneX = true
                }
                
                if point.x == points[index].x - i && !doneX {
                    doneX = true
                }
                
                if point.y == points[index].y + i {
                    doneY = true
                }
                
                if point.y == points[index].y - i && !doneY {
                    doneY = true
                }
                
                if doneY && doneX {
                    if doneY && doneX {
                        same = true
                    } else {
                        same = false
                    }
                }
                
                i = i + 1
            }
        }
        if same {
            print("Found!!!")
            found = spell
            break
        }
    }
    
    print(found ?? "Not found")
    
    if found == nil {
        return
    }
    
    if URL(string: found!.url) == nil {
        throw SpellRunnerErrors.badURL
    }
    // Sending request
    let url = URL(string: found!.url)!

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {                                              // check for fundamental networking error
            print("error", error ?? "Unknown error")
            return
        }

        guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
            print("statusCode should be 2xx, but is \(response.statusCode)")
            print("response = \(response)")
            return
        }

        let responseString = String(data: data, encoding: .utf8)
        print("responseString = \(String(describing: responseString))")
    }
    task.resume()
}
