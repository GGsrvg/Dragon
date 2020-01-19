//
//  MainTableViewCell.swift
//  testView
//
//  Created by GGsrvg on 19.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import ImageLoader

class MainTableViewCell: UITableViewCell {

    @IBOutlet private var label: UILabel!
    
    @IBOutlet private var heroeImage: UIImageView!
    
    func setData(_ item: Item){
        self.label.text = item.name
        self.heroeImage.load.request(with: URL(string: item.image)!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
