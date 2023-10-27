//
//  ContentView.swift
//  To Do List
//
//  Created by Maksym on 2023-10-26.
//

import SwiftUI


struct ContentView: View {
    @State private var showAddModal = false
    
    @Environment(ModelData.self) var modelData

    
    var body: some View {
            NavigationSplitView {
                VStack {
                    Spacer()
                    if modelData.tasks.isEmpty {
                        Text("There is nothing to do!")
                    } else {
                        List(modelData.tasks) { task in
                            Text(task.task)
                        }
                    }
                    Spacer()
                    HStack {
                        Button{
                            self.showAddModal.toggle()
                        } label: {
                            Label("title: Add something to do", systemImage: "plus")
                                .padding()
                                .labelStyle(.iconOnly)
                                .foregroundStyle(.primary)
                        }
                        .sheet(isPresented: $showAddModal) {
                            AddTask(showAddModal: self.$showAddModal)
                        }
                        Spacer()
                    }
                }
                .navigationTitle("Your tasks")
            } detail: {
                Text("Select your task")
            }
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
