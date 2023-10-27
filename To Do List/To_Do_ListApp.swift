//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Maksym on 2023-10-26.
//

import SwiftUI

@main

struct To_Do_ListApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
