//
//  WTTestTableViewCell.swift
//  WTKitTester
//
//  Created by 宋文通 on 2019/10/25.
//  Copyright © 2019 宋文通. All rights reserved.
//

import UIKit
import WTKit
open class CellModel:UITableViewCellDetailModelSample{
    var title:String = ""
}
class WTTestTableViewCell: UITableViewCell,UINibReusableCell,UITableViewCellModelHolder {
    var model: UITableViewCellModel?{
        didSet{
            if let c = model as? CellModel{
                self.detailModel = c
            }
        }
    }
    var detailModel:CellModel?{
        didSet{
            updateUI()
        }
    }
    func updateUI()  {
        self.textLabel?.text = detailModel?.title
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
