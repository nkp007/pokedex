//
//  ViewController.swift
//  pokedex
//
//  Created by Neil Patel on 7/12/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import UIKit

//need delegates for CollectionView, Delegate = this class will be delegate for CollectionView, DataSource = this class will hold data for CollectionView, FlowLayout = will set settings for layout for CollectionView
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign delegate and datasource to self. ?????
        collection.dataSource = self
        collection.delegate = self
        
    }
//you don't want app to load all 718 cells (will crash), so it'll load only how many will be displayed at a time. so when you scroll off, those that go off screen dequeue and you pick up another cell. if we can grab one dequeue do it, otherwise return empty generic cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell { //this is where you used the reuseidentifier
            
            let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row)
        cell.configureCell(pokemon: pokemon) //pass in pokemon object that you just created. 
            
            return cell
    } else {
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
        return CGSize(width: 105, height: 105) //this is what we have it set for in the storyboards. defines size of cells.
    }

}


//the git has been initialized.
//update the alamofire pod
    //in podfile - check github for alamofire installation instructions for podfile.
    //pod install instead of podupdate in terminal
    
