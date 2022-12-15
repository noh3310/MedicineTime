//
//  Task.swift
//  MedicineTime
//
//  Created by 노건호 on 2022/12/14.
//
import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current

    let date = calendar.date(byAdding: .day, value: offset, to: Date())

    return date ?? Date()
}

var tasks: [TaskMetaData] = [

    TaskMetaData(task: [
        Task(title: "Talk to iJustine"),
        Task(title: "iPhone 13 gread design change"),
        Task(title: "Nothing Much Workout!!"),
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
        Task(title: "Task to Jenna Ezarik"),
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [
        Task(title: "Task to Jenna Cook"),
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task: [
        Task(title: "Task to Jenna SwiftUI"),
    ], taskDate: getSampleDate(offset: 10)),
    TaskMetaData(task: [
        Task(title: "Task to Jenna Design Change"),
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task: [
        Task(title: "Task to Jenna Ezarik"),
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task: [
        Task(title: "Task to Jenna Ezarik"),
    ], taskDate: getSampleDate(offset: -20)),
]
