//
//  ModelData.swift
//  To Do List
//
//  Created by Maksym on 2023-10-27.
//

import Foundation

@Observable class ModelData {
    var tasks: [Task] = []
}

struct Task: Codable, Identifiable {
    var descripton: String
    var id: Int
    var task: String
    var tillDate: Date
    var tillTime: Date
}
