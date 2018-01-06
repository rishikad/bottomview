//
//  ViewController.swift
//  bottomsheet
//
//  Created by Rishika Datla on 12/20/17.
//  Copyright © 2017 Rishika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    func addBottomSheetView(){
        let bottomsheetVC = bottomViewController()
        self.addChildViewController(bottomsheetVC)
        self.view.addSubview(bottomsheetVC.view)
        bottomsheetVC.didMove(toParentViewController: self)
        bottomsheetVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: view.frame.width, height: view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addBottomSheetView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

