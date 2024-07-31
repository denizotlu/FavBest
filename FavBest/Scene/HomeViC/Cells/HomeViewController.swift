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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func setupUI() {
                
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifer)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
            
            
            let mainHeader = MainHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 0 * 0))
            view.addSubview(mainHeader)
            tableView.tableHeaderView = mainHeader
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



