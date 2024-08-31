//
//  NetworkConstans.swift
//  FavBest
//
//  Created by Deniz Otlu on 3.08.2024.
//

import Foundation

// POPULER : https://api.themoviedb.org/3/movie/popular?api_key=facd75b61c54d7ac474afc6cf81186df

protocol EndPointProtocol {
    var baseUrl : String {get}
    var genreUrl : String {get}
    var apiKey : String {get}
    var method : HTTPMethod {get}
    
    func movieApiURL() -> String
    func request() -> URLRequest
}

enum HTTPMethod : String {
    case post = "POST"
    case get = "GET"
}

enum EndPoint {
    case popular
    case topRated
    case upComing
}


extension EndPoint : EndPointProtocol{
    var baseUrl: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreUrl: String {
     switch self{
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upComing:
            return "upcoming"
        }
    }
    
    var apiKey: String {
        return "?api_key=facd75b61c54d7ac474afc6cf81186df"
    }
    
    var method: HTTPMethod {
        switch self {
        case .popular: return .get
            
        case .topRated: return .get
            
        case .upComing: return .get
        }
    }
    
    
    
    func movieApiURL() -> String {
       return "\(baseUrl)\(genreUrl)\(apiKey)"
       // return "https://api.themoviedb.org/3/movie/popular?api_key=facd75b61c54d7ac474afc6cf81186df"
    }
    
    
    func request() -> URLRequest {
        guard let apiURL = URLComponents(string: movieApiURL())else{
            fatalError("URL Error")
        }
        
        guard let url = apiURL.url else {
            fatalError("not url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
        }
    
    
    
}
