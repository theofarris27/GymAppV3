//
//  MuscleListView.swift
//  Gym App
//
//  Created by Luc Rathbun on 4/10/24.
//

import SwiftUI

struct MuscleListView: View {
    
    @State private var muscles = Muscles.preview()
    
    var body: some View{
        List(muscles, id : \.name) { muscles in
            Text(muscles.name)
        }
    }
}
    
struct MuscleListView_previews: PreviewProvider {
    static var previews: some View {
        MuscleListView()
    }
    
}
