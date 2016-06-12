//
//  ArticleListViewController.swift
//  CocoaPodsExample
//
//  Created by hnw on 2016/06/12.
//  Copyright © 2016年 hnw. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新着記事"

        table.frame = view.frame
        view.addSubview(table)
    }
}

