//
//  SwiftUIView.swift
//  App
//
//  Created by Samuel Lim on 4/22/24.
//

import SwiftUI

struct MuscleListView: View {
    
    @StateObject var viewModel = ModelData()
    let mus : String
    
    var body: some View {
        NavigationStack{
            List{
                ForEach($viewModel.exercises.wrappedValue, id: \.self){ exer in
                    NavigationLink(destination: ExerciseDetailView(thisExercise: exer)) {
                        Text(exer.name)
                    }
                }
            }
            .navigationTitle(mus)
            .onAppear{
                viewModel.fetch(musc: mus)
            }
        }
    }
}
