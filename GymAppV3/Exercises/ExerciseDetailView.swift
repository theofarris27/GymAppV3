//
//  ExerciseDetailView.swift
//  App
//
//  Created by Samuel Lim on 4/24/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    
    let thisExercise: Exercise
    
    var body: some View {
        VStack{
            Text(thisExercise.name)
            Text(thisExercise.muscle)
            Text(thisExercise.equipment)
            Text(thisExercise.difficulty)
            Text(thisExercise.instructions)
        }
    }
}
