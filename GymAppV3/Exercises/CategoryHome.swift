//
//  ExerciseListView.swift
//  Gym App
//
//  Created by Samuel Lim on 3/27/24.
//

import SwiftUI



struct CategoryHome: View{
    
    let model : [listofex]
    
    var body: some View{
        List(model) { ex in
            NavigationLink(destination: MuscleListView(mus: ex.name)){
                Text(ex.name)
            }
        }
        .navigationTitle("Exercises")
    }
}


#Preview {
    CategoryHome(model: ExerciseList)
}

