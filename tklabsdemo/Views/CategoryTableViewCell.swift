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
    @IBOutlet weak var baseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        //customizing cells separators
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 10.0
        clipsToBounds = false
        layer.cornerRadius = 20
        
        baseView.layer.cornerRadius = 20
        baseView.layer.shadowOpacity = 0.2
        baseView.layer.shadowOffset = .zero
        baseView.layer.shadowRadius = 12.0
        baseView.layer.shadowColor = UIColor.lightGray.cgColor
        baseView.layer.masksToBounds = false
    }

    var category: Category? {
        didSet {
            iconImageView.image = category?.icon
            categoryName.text = category?.name
            tasksLabel.text = "\(String(describing: category?.numberOfTasks ?? 0)) Tasks"
        }
    }
    
}
