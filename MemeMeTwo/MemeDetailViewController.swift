//
//  MemeDetailViewController.swift
//  MemeMeTwo
//
//  Created by LAfaraujo on 04/12/18.
//  Copyright © 2018 Fernanda Araujo. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {

    var meme: Meme!

    @IBOutlet weak var memePreview: UIImageView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBarController?.tabBar.isHidden = true

        memePreview.contentMode = .scaleAspectFit
        memePreview.image = meme.memedImage
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tabBarController?.tabBar.isHidden = false
    }
}
