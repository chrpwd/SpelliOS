//
//  GameViewController.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 2/26/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit


class GameViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private static var cellReuseIdentifier = "CollectionViewController.DatasetItemsCellIdentifier"

    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.setNeedsDisplay()
        collectionView?.reloadData()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView!.register(BoardCell.self, forCellWithReuseIdentifier: GameViewController.cellReuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return number of cells in a gameboard
        return 108
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> BoardCell {
        guard collectionView == self.collectionView, indexPath.section == 0, indexPath.row < 108
            else{
                return BoardCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameViewController.cellReuseIdentifier, for: indexPath) as! BoardCell
        cell.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/10, height: collectionView.frame.height/13)
    }
    

    
}
