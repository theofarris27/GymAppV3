//
//  ExerciseListView.swift
//  Gym App
//
//  Created by Samuel Lim on 3/27/24.
//

import SwiftUI

struct ExerciseListView: View{
    @Environment(NetworkModel.self) var networkModel
    
    var body: some View{
        NavigationView{
            List{
                ForEach(networkModel.exercises.keys.sorted(), id: \.self) { exercise in
                    }
                }
                
            }
            .navigationTitle("Exercises")
            .onAppear{
                    networkModel.fetchExercises()
                }
        
        }
    }

#Preview {
    ContentView()
        .environment(NetworkModel())
}
