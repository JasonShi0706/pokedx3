//
//  ViewController.swift
//  pokedx3
//
//  Created by Shi Yangguang on 4/2/17.
//  Copyright © 2017 Shi Yangguang. All rights reserved.
//

import UIKit

// UICollectionViewDelegate, this is to say this class is going to delegate the collection view
// UICollectionViewDelegate, this is to say this class is to hold the data
// UICollectionViewDelegateFlowLayout is the protocol to modify and setting for the collections of the view
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //firstly, assign the datasource and delegate to self
        collection.dataSource = self
        collection.delegate = self
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // you donot want to load all the pictures at the same time, which would be crash, you want them to queue
        // and load when needed.
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row)
            cell.configureCell(pokemon: pokemon)
            
            return cell
        } else {
            // just return generic empty cell
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }


}

