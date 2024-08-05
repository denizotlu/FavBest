//
//  HomeViewModel.swift
//  FavBest
//
//  Created by Deniz Otlu on 3.08.2024.
//

import Foundation

    class HomeViewModel: MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate?
    var service : ApiServiceProtocol
    
    init(service: ApiServiceProtocol) {
        self.service = service
    
    }
    
    
 /*   func load() {
        service.fetchData(.popular) { (result: Result<Movie,Error>) in
            switch result {
            case.success(let movie):
                self.delegate?.handleOutput(.popular(movie.results))
                
            case.failure(let error):
                self.delegate?.handleOutput(.error(error))
                
        }
    }
} */
 
    func load(){
        service.fetchData(.popular) { (result: Result<Movie, Error>) in
            switch result {
            case .success(let movie):
                self.delegate?.handleOutput(.popular(movie.results))
            case .failure(let error):
                self.delegate?.handleOutput(.error(error))

            }
        }
    }
    
    
    
}
