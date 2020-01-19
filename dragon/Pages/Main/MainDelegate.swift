//
//  MainDelegate.swift
//  testView
//
//  Created by GGsrvg on 17.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

protocol MainDelegate {
    var dataSource: ApiResponse? { get }
    
    func openSecond(_ id: Int)
}
