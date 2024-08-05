//
//  CollectionTableViewCell.swift
//  FavBest
//
//  Created by Deniz Otlu on 31.07.2024.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    static let identifer = "CollectionTableViewCell"
    
    private var colletionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createCollectionView (){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWidth * 0.6, height: screenWidth * 0.45)
        colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifer)
        colletionView.dataSource = self
        colletionView.delegate = self

        contentView.addSubview(colletionView)
        colletionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
            
            
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifer, for: indexPath)
        cell.backgroundColor = .purple
        return cell
    }
    
    
}
