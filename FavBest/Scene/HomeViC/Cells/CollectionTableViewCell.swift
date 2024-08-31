//
//  CollectionTableViewCell.swift
//  FavBest
//
//  Created by Deniz Otlu on 31.07.2024.
//

import UIKit

class CollectionTableViewCell: UITableViewCell{
   

    static let identifer = "CollectionTableViewCell"
    var movieArr = [MovieResult]()
    
    private var colletionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCollectionView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWidth * 0.35, height: screenWidth * 0.35)
        colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifer)
        colletionView.dataSource = self
        colletionView.delegate = self
        
        colletionView.backgroundColor = .black

        contentView.addSubview(colletionView)
        
        colletionView.snp.makeConstraints { make in
        /*    make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)*/
            
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
    }
        
    }
    
 
   
    
    public func configure(movies: [MovieResult]) {
        self.movieArr = movies
        DispatchQueue.main.async {
            self.colletionView.reloadData()
        }
        
        
    }
    
}



extension CollectionTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifer, for: indexPath) as! MovieCollectionViewCell
        if let model = movieArr[indexPath.row].posterPath as? String {
            cell.configuree(model: model)
          }
        
        return cell
        

    }
    
    
    
    
}

#Preview{
    MainTabbarController()
}
