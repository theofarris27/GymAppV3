//
//  NavigationLinkView.swift
//  App
//
//  Created by Samuel Lim on 4/22/24.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
        NavigationView{
            CategoryHome(model: ExerciseList)
        }
    }
}

#Preview {
    NavigationLinkView()
}
