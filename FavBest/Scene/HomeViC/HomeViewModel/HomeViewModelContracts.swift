//
//  HomeViewModelContracts.swift
//  FavBest
//
//  Created by Deniz Otlu on 3.08.2024.
//

import Foundation

protocol MovieListViewModelProtocol{
    
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    
}

protocol MovieListViewModelDelegate {
    
    func handleOutput(_ output: MovieListViewModelOutput)
    
}

enum MovieListViewModelOutput {
    case popular ([MovieResult])
    case upComing ([MovieResult])
    case topRated ([MovieResult])
    case error  (Error)
}

