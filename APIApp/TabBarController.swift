//
//  TabBarController.swift
//  APIApp
//
//  Created by Vu Duy on 15/07/2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let allItems:[AnyObject] = self.tabBar.items!
        let item1:UITabBarItem = allItems[0] as! UITabBarItem
        let item2:UITabBarItem = allItems[1] as! UITabBarItem


        item1.image = UIImage(systemName: "list.bullet.rectangle")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        item2.image = UIImage(systemName: "mappin")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }

}
