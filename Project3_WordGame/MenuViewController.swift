//
//  MenuViewController.swift
//  Project3_WordGame
//
//  Created by Christian Purdy on 3/5/18.
//  Copyright © 2018 Christian Purdy. All rights reserved.
//

import UIKit

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, DatasetDelegate {
    
    var delegateID: String = ""
    
    private static var cellReuseIdentifier = "TableViewController.DatasetItemsCellIdentifier"

    
    func datasetUpdated() {
        collectionView?.reloadData()
    }
    
    let cell = "cellID"
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.setNeedsDisplay()
        collectionView?.reloadData()
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        let gradient = Gradient();
        collectionView?.backgroundView = gradient
        super.viewDidLoad()
        navigationItem.title = "Active Games"
        collectionView?.delegate = self
        collectionView?.dataSource = self
        GameViewController.registerDelegate(self)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MenuViewController.cellReuseIdentifier)

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return number of Games in collection view
        print(GameViewController.count)

        return GameViewController.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == self.collectionView, indexPath.section == 0, indexPath.row < GameViewController.count
            else{
                return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuViewController.cellReuseIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
    
    
    
    
}
