//
//  ApiCaller.swift
//  FavBest
//
//  Created by Deniz Otlu on 3.08.2024.
//

import Foundation


protocol ApiServiceProtocol {
    func fetchData<T: Decodable>(_ endPoint: EndPoint, completion: @escaping (Result<T,Error>) -> Void )
    
}

 class ApiCaller: ApiServiceProtocol{
    
    func fetchData<T: Decodable>(_ endPoint : EndPoint, completion: @escaping (Result<T,Error>) -> Void ){
        
        let task = URLSession.shared.dataTask(with: endPoint.request()) { data, response, error in
            if let error = error{
                 
                completion(.failure(error))
                
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                return
            }
            
            guard let data = data else{
                
                completion(.failure(URLError.self as! Error))
                return
            }
            
            
          do{
                let decoderData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoderData))
            }catch let error{
            
               print("catch error")
            }
        }
        
        task.resume()
        
        
    }
    
    
    
}
