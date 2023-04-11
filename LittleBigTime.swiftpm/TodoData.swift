//
//  TodoData.swift
//  LittleBigTime
//
//  Created by Sebin Kwon on 2023/04/08.
//

import Foundation

struct TodoData {
    let id: String = UUID().uuidString
    var todo: String
    var time: Int
}
