//
//  TableViewCellCard.swift
//  U!Pay
//
//  Created by Hamest Tadevosyan on 01/08/2018.
//  Copyright © 2018 IUNetworks.am. All rights reserved.
//

import UIKit

class TableViewCellCard: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var rightSubTitle: UILabel!
    @IBOutlet weak var border: UIView!
    var iconUrl: String?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.clipsToBounds = true
        icon.layer.cornerRadius = Constants.Limits.iconCornerRadius
        
        border.clipsToBounds = true
        border.layer.cornerRadius = Constants.Limits.cellCornerRadius
        
        title.setStyle(with: Constants.LabelStyle.contentTextTitle)
        subTitle.setStyle(with: Constants.LabelStyle.contentTextDescription)
        rightSubTitle.setStyle(with: Constants.LabelStyle.contentTextSmall)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let backgroundView = UIView()
        backgroundView.backgroundColor = .selectedCellColor
        self.selectedBackgroundView = backgroundView
    }
}
