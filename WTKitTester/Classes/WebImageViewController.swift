//
//  WebImageViewController.swift
//  WTKitTester
//
//  Created by 宋文通 on 2019/10/24.
//  Copyright © 2019 宋文通. All rights reserved.
//

import UIKit
import WTKit
class WebImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension WebImageViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImageLoader.sampleImageURLs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let iv = cell.contentView.viewWithTag(1) as? WebImageView{
            iv.image = nil
            iv.loadWebImage(with: ImageLoader.sampleImageURLs[indexPath.row].absoluteString)
        }
        return cell
    }
    
    
}
