//
//  MainView.swift
//  testView
//
//  Created by GGsrvg on 17.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class MainView: UIView {

    var delegate: MainDelegate!

    @IBOutlet private var tableView: UITableView!
    
    func initPage(){
        self.tableView.delegate = self
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MainTableViewCell")
        self.tableView.dataSource = self
        self.tableView.rowHeight = 106
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.delegate.dataSource?.items.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.setData(self.delegate.dataSource!.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.openSecond(indexPath.row)
    }
}

extension MainView: MainViewDelegate {
    func reloadTableView() {
        self.tableView.reloadData()
    }
}
