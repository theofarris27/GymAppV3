//change
//  Exercise.swift
//  Gym App
//
//  Created by Samuel Lim on 4/12/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Exercise: Hashable, Codable, Identifiable{
    let id: Int
    let name: String
    let equipment: String
    let difficulty: String
    let muscle: Muscle
    enum Muscle: String, CaseIterable, Codable{
        case abdominals
        case abductors
        case adductors
        case biceps
        case calves
        case chest
        case forearms
        case glutes
        case hamstrings
        case lats
        case lower_back
        case middle_back
        case neck
        case quadriceps
        case traps
        case triceps
    }
}
