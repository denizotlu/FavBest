//
//  HomeViewModelBuilder.swift
//  FavBest
//
//  Created by Deniz Otlu on 4.08.2024.
//

import Foundation

    class MovieListBuilder{
    
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let viewModel = HomeViewModel(service: ApiCaller())
        vc.viewModel = viewModel
        return vc
        
        
        
    }
    
    
}
