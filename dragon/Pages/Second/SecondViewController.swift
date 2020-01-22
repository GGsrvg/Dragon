//
//  SecondViewController.swift
//  testView
//
//  Created by GGsrvg on 17.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let secondView = UINib(nibName: "Second", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SecondView
    
    init(_ item: Item? = nil) {
        super.init(nibName: nil, bundle: nil)
        
        if let item = item {
            self.secondView.setData(item)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = secondView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
