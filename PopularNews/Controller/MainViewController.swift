//
//  ViewController.swift
//  Most Popular News
//
//  Created by Karthik on 23/07/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    
    let news = NewsData()
    var index : Int?
    let helper = Helper()
    @IBOutlet var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        news.getData()
        helper.loadInd(vc: self)
        helper.showActIndicator()
        news.reload = { [weak self] in
            DispatchQueue.main.async {
                self!.tv.reloadData()
                self!.helper.stop()
            }
        }

    }
    
}


extension MainController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if news.articles != nil {
            return news.articles!.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MainTableViewCell
        cell.title.text = news.title?[indexPath.row]
        cell.reporter.text = news.reporter?[indexPath.row]
        cell.date.text = news.date?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.item
        if index != nil {
            performSegue(withIdentifier: detailSegue, sender: self)
        } else {
            print("index nil")
            return
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.input = news.url?[index!]
    }
    
    
    
    
}



