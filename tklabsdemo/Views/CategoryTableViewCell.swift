//
//  TableViewCell.swift
//  tklabsdemo
//
//  Created by Slobodan Kovrlija on 5/19/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var tasksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    var category: Category? {
        didSet {
            iconImageView.image = category?.icon
            categoryName.text = category?.name
            tasksLabel.text = "\(String(describing: category?.numberOfTasks ?? 0)) Tasks"
        }
    }
    
}
