//
//  API.swift
//  Reswift-Example
//
//  Created by Vinícius Leão Salmont on 02/05/18.
//  Copyright © 2018 Salmont. All rights reserved.
//

import Foundation

final class API {
    
    static let sharedInstance = API()
    
    func loadMillionaryIdea(completion: @escaping (Idea?) -> Void) {
        let baseURL = "https://itsthisforthat.com/api.php?json"
        guard let stringURL = URL(string: baseURL) else { return }
        let urlRequest = URLRequest(url: stringURL)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil)
                return
            }
            
            do {
                guard let data = data else {
                    completion(nil)
                    return
                }
                let genialIdea = try self.parseJSONToIdea(data)
                
                DispatchQueue.main.async {
                    completion(genialIdea)
                }
            } catch let error {
                print("Could not get data from the server due to: \(error)  ")
            }
        }
        
        task.resume()
    }
    
    func parseJSONToIdea(_ responseData: Data) throws -> Idea? {
        do {
            let idea = try JSONDecoder().decode(Idea.self, from: responseData)
            return idea
        } catch {
            fatalError("Could not decode JSON")
        }
        
        return nil
    }
}
