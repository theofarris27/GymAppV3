//
//  ModelData.swift
//  App
//
//  Created by Samuel Lim on 4/18/24.
//

import Foundation
import SwiftUI

class ModelData : ObservableObject{
    
    @Published var exercises : [Exercise] = []
    
    func fetch(musc: String){
        let muscle = musc.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!)!
        var request = URLRequest(url: url)
        request.setValue("rb8aJ0MS1SPFenqVNJYw6w==YwL1SPSEuTqmZuES", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            do{
                let exercises = try JSONDecoder().decode([Exercise].self, from: data)
                DispatchQueue.main.async{
                    self.exercises = exercises
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()

    }
}
