//
//  MainiPadView.swift
//  dragon
//
//  Created by GGsrvg on 22.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class MainiPadView: UIView {
    
    @IBOutlet private var ListUIView: UIView!
    @IBOutlet private var AboutUIView: UIView!
    private var currentAboutView: UIView?
    
    func setViews(main listView: UIView, second about: UIView){
        self.ListUIView.addSubview(listView)
        listView.addConstraints(self.ListUIView.constraints)
        
        
        self.AboutUIView.addSubview(about)
        about.addConstraints(self.ListUIView.constraints)
    }
    
    func replaceAboutView(_ newView: UIView){
        currentAboutView?.removeFromSuperview()
        self.AboutUIView.addSubview(newView)
        newView.frame = CGRect(x: 0,
                               y: 0,
                               width: self.AboutUIView.frame.width,
                               height: self.AboutUIView.frame.height)
        currentAboutView = newView
    }
}
