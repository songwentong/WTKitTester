//
//  ViewController.swift
//  WTKitTester
//
//  Created by 宋文通 on 2019/10/14.
//  Copyright © 2019 宋文通. All rights reserved.
//

import UIKit
import WTKit
class WTTestModel: NSObject,UITableViewCellModel {
    var reuseIdentifier: String = "cell"
    var title:String = "title"
    var action:DispatchWorkItem = DispatchWorkItem.init {
        
    }
}
class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var tableViewModel = UITableViewModelSample.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.registNibReuseableCell(WTTestTableViewCell.self)
        myTableView.dataSource = tableViewModel
        myTableView.delegate = tableViewModel
        //Section
        tableViewModel.appendSectionWithClosure { () -> UITableViewSectionModel in
            return UITableViewSectionModelSample.init()
        }
        //Cell
        tableViewModel.appendCellDetailModelToLastSectionWithClosure { () -> UITableViewCellModel in
            let model = CellModel.init()
            model.reuseIdentifier = WTTestTableViewCell.reuseIdentifier
            model.title = "Basic"
            model.didSelectAction = DispatchWorkItem.init(block: {[weak self]in
                self?.performSegue(withIdentifier: "imageLoad", sender: nil)
            })
            return model
        }
        //Cell
        tableViewModel.appendCellDetailModelToLastSectionWithClosure { () -> UITableViewCellModel in
            let model = CellModel.init()
            model.reuseIdentifier = WTTestTableViewCell.reuseIdentifier
            model.title = "Web Image"
            model.didSelectAction = DispatchWorkItem.init(block: {[weak self]in
                self?.performSegue(withIdentifier: "webImage", sender: nil)
            })
            return model
        }
    }
}
