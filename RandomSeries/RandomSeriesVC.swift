//
//  RandomSeriesVC.swift
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

import UIKit

class RandomSeriesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.blue
        
        BasicOpPack().shuffledArray(withElements: 10)
    }

}
