//
//  MainiPadViewController.swift
//  dragon
//
//  Created by GGsrvg on 21.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class MainiPadViewController: UIViewController {

    
    let mainiPadView = UINib(nibName: "MainiPad", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MainiPadView
    
    var currentView: UIView?
    
    var mainViewController: MainViewController = MainViewController()
    var secondViewController: SecondViewController = SecondViewController()
    
    override func loadView() {
        self.addChild(self.mainViewController)
        
        self.view = mainiPadView
        self.mainiPadView.setViews(main: self.mainViewController.view,
                                   second: self.secondViewController.view)
        self.mainViewController.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Heroes"
        self.navigationItem.largeTitleDisplayMode = .never
        
        //currentView = second
        // Do any additional setup after loading the view.
    }
    
    func replace(_ newView: UIView){
        mainiPadView.replaceAboutView(newView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
