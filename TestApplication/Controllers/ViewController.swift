//
//  ViewController.swift
//  TestApplication
//
//  Created by Petro Golishevskiy on 19.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let network = Network.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        print("jhgjhgb")
        network.getPosts { posts in
            for i in posts {
                print(i.title)
            }
        }
    }


}

