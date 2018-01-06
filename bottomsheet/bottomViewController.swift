//
//  bottomViewController.swift
//  bottomsheet
//
//  Created by Rishika Datla on 12/20/17.
//  Copyright © 2017 Rishika. All rights reserved.
//

import UIKit

class bottomViewController: UIViewController {

    
    func prepareBackgroundView(){
        let blurEffect = UIBlurEffect.init(style: .prominent)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds
        view.insertSubview(bluredView, at: 0)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = self.view.frame.minY
        self.view.backgroundColor = UIColor.blue
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(bottomViewController.panGesture))
        view.addGestureRecognizer(gesture)

        // Do any additional setup after loading the view.
    }
    
    @objc func panGesture(recognizer: UIPanGestureRecognizer){
       let translation = recognizer.translation(in: self.view)
       let x = self.view.frame.minY + translation.y
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    
      if (x < 636 && x > 500){
           
        UIView.transition(with: self.view,
                          duration: 0.5,
                          options: UIViewAnimationOptions.curveLinear,
                          animations: { self.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height) },
                          completion: nil)
        
        }
         else if (x > 100 && x < 200 ){
         
            UIView.transition(with: self.view,
                              duration: 0.5,
                              options: UIViewAnimationOptions.curveEaseOut,
                              animations: { self.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 100, width: self.view.frame.width, height: self.view.frame.height) },
                              completion: nil)
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        prepareBackgroundView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            let frame = self?.view.frame
            let yComponent = UIScreen.main.bounds.height - 100
            self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
