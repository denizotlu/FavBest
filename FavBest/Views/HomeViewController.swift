//
//  HomeViewController.swift
//  FavBest
//
//  Created by Deniz Otlu on 30.07.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var Collec = CollectionTableViewCell()
    
    
    private var tableView = UITableView ()
    
    var arrayPopular = [MovieResult]()
    var arrayUpcoming = [MovieResult]()
    var arrayToprated = [MovieResult]()

    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.load()
        
    }
    
    func setupUI() {
                
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifer)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
            
            
            let mainHeader = MainHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight*0.35))
            tableView.tableHeaderView = mainHeader
            tableView.snp.makeConstraints { make in
                make.top.equalToSuperview()

            }
            
           // tableView.tableHeaderView = mainHeader
        }
        
    }
    
}
    

extension HomeViewController: MovieListViewModelDelegate{
    func handleOutput(_ output: MovieListViewModelOutput) {
        switch output{
            
        case.popular(let popular):
            self.arrayPopular = popular
            print(popular)
            
        case .upComing(let upcoming):
            self.arrayUpcoming = upcoming
            print(upcoming)

        case .topRated(let topRated):
            self.arrayToprated = topRated
            print(topRated)

        case .error(let error):
            print(error)
        }
    }
}
    
    
    extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifer, for: indexPath)
            cell.backgroundColor = .yellow
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }

    

    }



