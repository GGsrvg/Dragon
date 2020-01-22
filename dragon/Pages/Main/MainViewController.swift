//
//  MainViewController.swift
//  testView
//
//  Created by GGsrvg on 17.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {

    let mainView = UINib(nibName: "Main", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MainView
    var mainViewDelegate: MainViewDelegate!
    var secondController: SecondViewController!
    
    private var _dataSource: ApiResponse?
    
    override func loadView() {
        self.mainView.delegate = self
        self.mainViewDelegate = mainView
        self.view = self.mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.initPage()
        self.title = "Heroes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        _ = Api.items()
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { json in
                        self._dataSource = json
                        self.mainViewDelegate.reloadTableView()
                        print("JSON: ", json)
                        },
                       onError: { error in
                        print(error.localizedDescription)
                        })
    }
}

extension MainViewController: MainDelegate {
    var dataSource: ApiResponse? {
        get {
            return _dataSource
        }
    }
    
    func openSecond(_ id: Int) {
        secondController = nil
        secondController = SecondViewController(dataSource!.items[id])
        
        if let parent = self.parent as? MainiPadViewController {
            parent.replace(secondController.secondView)
        } else {
            self.navigationController?.present(secondController, animated: true, completion: nil)
        }
    }
}
