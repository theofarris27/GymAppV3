//
//  listofex.swift
//  App
//
//  Created by Samuel Lim on 4/22/24.
//

import Foundation

struct listofex: Identifiable {
    let id = UUID()
    let name : String
}

let ExerciseList: [listofex] = [
    listofex(name: "abdominals"),
    listofex(name: "abductors"),
    listofex(name: "adductors"),
    listofex(name: "biceps"),
    listofex(name: "calves"),
    listofex(name: "chest"),
    listofex(name: "glutes"),
    listofex(name: "forearms"),
    listofex(name: "hamstrings"),
    listofex(name: "lats"),
    listofex(name: "lower_back"),
    listofex(name: "middle_back"),
    listofex(name: "neck"),
    listofex(name: "quadriceps"),
    listofex(name: "traps"),
    listofex(name: "triceps"),
    listofex(name: "shoulders")
]

