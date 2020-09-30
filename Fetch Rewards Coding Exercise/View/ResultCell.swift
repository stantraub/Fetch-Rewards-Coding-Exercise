//
//  ResultCell.swift
//  Fetch Rewards Coding Exercise
//
//  Created by Stanley Traub on 9/29/20.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    func setItem(item: Item) {
        idLabel.text = "\(item.id)"
        nameLabel.text = "\(item.name)"
        listIdLabel.text = "\(item.listId)"
    }
}
