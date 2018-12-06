//
//  SentMemesCollectionViewController.swift
//  MemeMeTwo
//
//  Created by LAfaraujo on 01/12/18.
//  Copyright © 2018 Fernanda Araujo. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    var memes: [Meme]!

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        let space: CGFloat
        let dimension: CGFloat

        if (UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            space = 3.0
            dimension = (view.frame.size.width - (2 * space)) / 3
        } else {
            space = 1.0
            dimension = (view.frame.size.width - (1 * space)) / 5
        }

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes

        collectionView?.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as! MemeCollectionViewCell

        cell.imageView?.image = memes[indexPath.row].memedImage
        cell.imageView?.contentMode = .scaleAspectFit

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let memeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController

        memeDetailViewController.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
}
