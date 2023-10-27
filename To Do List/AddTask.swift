//
//  AddTask.swift
//  To Do List
//
//  Created by Maksym on 2023-10-26.
//

import SwiftUI


struct AddTask: View {
    @Environment (ModelData.self) var modelData
    @State private var task = ""
    @State private var tillDate = Date()
    @State private var tillTime = Date()
    @State private var description = ""
    @Binding var showAddModal: Bool
    
    func getNewId() -> Int {
        if (modelData.tasks.isEmpty) {
            return 1
        } else {
            var biggestId = 0
            for task in modelData.tasks {
                if task.id > biggestId {
                    biggestId = task.id
                }
            }
            return biggestId + 1
        }
    }
    
    func addTask() {
        let task = Task(
            descripton: description,
            id: getNewId(),
            task: task,
            tillDate: tillDate,
            tillTime: tillTime
        )
        modelData.tasks.append(task)
    }
    
    var body: some View {
        VStack {
            TextField("Task", text: $task)
                .textFieldStyle(.roundedBorder)
                .padding(.top)
                .foregroundStyle(.primary)
                .font(Font.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Color.primary)
            
            HStack {
                DatePicker(selection: $tillDate, in: ...Date.now, displayedComponents: .date) {
                    Text("Date to be done")
                }
                .labelsHidden()
                Spacer()
                DatePicker(selection: $tillTime, in: ...Date.now, displayedComponents: .hourAndMinute) {
                    Text("Date to be done")
                }
                .labelsHidden()
            }
                .padding(.top)
            TextField(
                "Description",
                text: $description,
                axis: .vertical)
                .padding(.top)
            Spacer()
            Button("Add") {
                addTask()
                showAddModal.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    AddTask(showAddModal: .constant(true))
        .environment(ModelData())
}
