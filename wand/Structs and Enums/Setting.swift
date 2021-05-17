//
//  Setting.swift
//  wand
//
//  Created by Juliette on 5/17/21.
//

import Foundation

struct Setting {
    let label: String
    let key: String
    let inputType: InputType
}

enum InputType {
    case keyboard
}
