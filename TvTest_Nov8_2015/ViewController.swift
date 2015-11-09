//
//  ViewController.swift
//  TvTest_Nov8_2015
//
//  Created by Gabriel Querbes on 11/8/15.
//  Copyright © 2015 The Modern Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    @IBOutlet weak var CollectionView: UICollectionView!
    
    let URL_BASE = "http://api.themoviedb.org/3/movie/popular?api_key=ff743742b3b6c89feb59dfc138b4c12f"
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func downloadData(){
        let url = NSURL (string: URL_BASE)!
        let request = NSURLRequest (URL: url)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if error != nil{
                print (error.debugDescription)
            }
            else{
                do{
                    let dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Dictionary<String,AnyObject>
                    
                    if let results = dict! ["results"] as? [Dictionary<String,AnyObject>]{

                        print(results)
                    }
                }
                catch{
                    
                }
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //size of box that holds image and title
        return CGSizeMake(339, 559)
    }

}

