//
//  CategoryRow.swift
//  Gym App
//
//  Created by Samuel Lim on 4/12/24.
//

import SwiftUI

struct CategoryRow: View{
    
    var muscle: String
    var items: [Exercise]
    
    
    var body: some View{
        Text("HJ")
    }
}


#Preview{
    let exercises = NetworkModel().exercises
    return CategoryRow(
        muscle: exercises[0].muscle.category.rawValue,
        items: Array(exercises.prefix(3))
        
    )
}
