//
//  Exercise.swift
//  App
//
//  Created by Samuel Lim on 4/18/24.
//
import Foundation
import SwiftUI
import CoreLocation

struct Exercise: Hashable, Codable {
    let name: String
    let equipment: String
    let muscle: String
    let difficulty: String
    let instructions: String
}
