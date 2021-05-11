//
//  WPoint.swift
//  wand
//
//  Created by Juliette on 5/11/21.
//

import Foundation

// Why does this exist?
// So the Point struct supplied from WandKit is unsigned 8 bit int and that works well for WandKit because of memory, however it being unsigned and 8 bits is not good for us because we only have 256 different numbers that we can use, including 0, and for spell recording we need to have negative numbers.
// So why don't you use 8 bit number instead of int in this?
// I like being able to have more than 511 numbers.

struct WPoint {
    var x: Int
    var y: Int
}
