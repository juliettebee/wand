//
//  Spell.swift
//  wand
//
//  Created by Juliette on 5/9/21.
//

import Foundation
import WandKit

struct Spell {
    
    var points: [WPoint]
    var url: NSURL
    
    mutating func save () {
        print(self.points)
    }
}
