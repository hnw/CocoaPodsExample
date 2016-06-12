//
//  ArticleListViewController.swift
//  CocoaPodsExample
//
//  Created by hnw on 2016/06/12.
//  Copyright © 2016年 hnw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleListViewController: UIViewController, UITableViewDataSource {
    let table = UITableView()
    var articles: [[String: String?]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新着記事"

        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self

        getArticles()
    }

    func getArticles() {
        Alamofire.request(.GET, "https://qiita.com/api/v2/items")
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                let json = JSON(object)
                json.forEach({ (_, json) in
                    let article: [String: String?] = [
                        "title": json["title"].string,
                        "userId": json["user"]["id"].string
                    ]
                    self.articles.append(article)
                })
                self.table.reloadData()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article["title"]!
        cell.detailTextLabel?.text = article["userId"]!
        return cell
    }
}

