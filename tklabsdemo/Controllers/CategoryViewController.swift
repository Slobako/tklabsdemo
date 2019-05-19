//
//  CategoryViewController.swift
//  tklabsdemo
//
//  Created by Slobodan Kovrlija on 5/19/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    var arrayOfCategories: [Category] = []
    let cellIdentifier = "CategoryCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        arrayOfCategories = DataManager.shared.populateCategories()
        
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        categoryTableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

        // to remove extra cells
        categoryTableView.tableFooterView = UIView()
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
            
        cell.category = arrayOfCategories[indexPath.row]
        
        return cell
    }

}
