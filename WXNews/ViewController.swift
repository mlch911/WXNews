//
//  ViewController.swift
//  WXNews
//
//  Created by 闵罗琛 on 2017/8/1.
//  Copyright © 2017年 闵罗琛. All rights reserved.
//

import UIKit
import Moya
import PageMenu

class ViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu!
    var controllers : [UIViewController] = []
    
//    @IBOutlet weak var resultLabel: UILabel!
//    @IBAction func cateBtnTap(_ sender: UIButton) {
//        
//        
//            
//            
//            
////            print(cates)
////            self.resultLabel.text = "返回成功，数目" + cates!.count.description
//
//        
//    }
    
    func showMenu() {
        Category.request { (cates) in
            
            self.controllers = cates!.map{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SBID_NEWSLIST") as! NewsListController
                
                vc.title = $0.title
                
                return vc
            }
            
            let parameters: [CAPSPageMenuOption] = [
                .menuItemSeparatorWidth(4.3),
                .scrollMenuBackgroundColor(UIColor.white),
                .viewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
                .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
                .selectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
                .menuMargin(20.0),
                .menuHeight(40.0),
                .selectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
                .unselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
                .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
                .useMenuLikeSegmentedControl(false),
                .menuItemSeparatorRoundEdges(true),
                .selectionIndicatorHeight(2.0),
                .menuItemSeparatorPercentageHeight(0.1)
            ]
            
            let frame = CGRect(x: 0, y: 20 + 44, width: self.view.frame.width, height: self.view.frame.height - 20 - 44)
            
            self.pageMenu = CAPSPageMenu(viewControllers: self.controllers, frame: frame, pageMenuOptions: parameters)
            
            self.view.addSubview(self.pageMenu.view)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMenu()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

