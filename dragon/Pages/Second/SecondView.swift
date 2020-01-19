//
//  SecondView.swift
//  testView
//
//  Created by GGsrvg on 17.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import ImageLoader

class SecondView: UIView {
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var desc: UILabel!
    
    func setData(_ item: Item){
        heroImage.load.request(with: URL(string: item.image)!)
        title.text = item.name
        desc.text = item.description
    }
}
