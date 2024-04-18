//
//  NetworkModel.swift
//  Gym App
//
//  Created by Samuel Lim on 4/12/24.
//

import Foundation

@Observable

class NetworkModel: ObservableObject{
    
    @Published var exercises : [Exercise] = []
    
    
    var categories: [String: [Exercise]] {
        Dictionary(
            grouping: exercises, by: {$0.muscle.rawValue}
        )
    }
    
    func fetchExercises(){
        
        let muscle = "biceps".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle="+muscle!) else{
            return
        }
        var request = URLRequest(url: url)
        request.setValue("rb8aJ0MS1SPFenqVNJYw6w==YwL1SPSEuTqmZuES", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {[weak self](data, response, error) in
            guard let data = data, error == nil else { return }
           
            print(response?.url)
            do{
                
                let exercises = try JSONDecoder().decode([Exercise].self, from: data)
                DispatchQueue.main.async{
                    self?.exercises = exercises
                }
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
}
