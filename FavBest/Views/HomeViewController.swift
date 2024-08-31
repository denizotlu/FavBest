//
//  HomeViewController.swift
//  FavBest
//
//  Created by Deniz Otlu on 30.07.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var Collec = CollectionTableViewCell()
    
    private var tableView = UITableView ()
    
    var arrayPopular = [MovieResult]()
    var arrayUpcoming = [MovieResult]()
    var arrayToprated = [MovieResult]()
    let sectionMovies : [String] = ["popular", "upComing Movies", "top Rated"]

    var viewModel: HomeViewModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.load()
        view.backgroundColor = .systemGroupedBackground
        setupUI()
      //  titlee()
    }
    
    
    
    func setupUI() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifer)
        view.addSubview(tableView)
        tableView.backgroundColor = .black
        
        let mainHeader = MainHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight*0.40))
        tableView.tableHeaderView = mainHeader

      /*  tableView.snp.makeConstraints { make in
            tableView.separatorStyle = .none
            tableView.snp.makeConstraints { make in
                make.top.left.right.bottom.equalToSuperview()
            }
            
           // tableView.tableHeaderView = mainHeader */
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
       
        
        
        }
        
    }
    
  /*  func titlee(){
        let titles : UILabel = {
            let labelTitles = UILabel()
            labelTitles.text = "Popular"
            labelTitles.backgroundColor = .black
            labelTitles.textColor = .systemYellow
            view.addSubview(labelTitles)

            labelTitles.snp.makeConstraints { make in
                make.top.equalTo(tableView.self.snp.top).offset(0)
            }
            
            return labelTitles
            
        }()
       
        
        
    }*/
    
 
    
  
    
    
    
    

    

extension HomeViewController: MovieListViewModelDelegate{
    func handleOutput(_ output: MovieListViewModelOutput) {
        switch output{
            
        case.popular(let popular):
            self.arrayPopular = popular
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        case .upComing(let upcoming):
            self.arrayUpcoming = upcoming
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        case .topRated(let topRated):
            self.arrayToprated = topRated
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        case .error(let error):
            print(error)
        }
    }
    
    
    
    
    
    
    
    
}
    
    
    extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return sectionMovies.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifer, for: indexPath) as! CollectionTableViewCell
            switch indexPath.section {
            case SectionsTableView.popular.rawValue:
                cell.configure(movies: arrayPopular)
            case SectionsTableView.topRated.rawValue:
                cell.configure(movies: arrayToprated)
            case SectionsTableView.upComing.rawValue:
                cell.configure(movies: arrayUpcoming)
                
            
            default:
                break
            }
            
            cell.backgroundColor = .yellow
            return cell
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 250
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
}





#Preview{
    MainTabbarController()
}

