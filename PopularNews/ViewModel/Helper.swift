//
//  Helper.swift
//  PopularNews
//
//  Created by Karthik on 12/08/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit


class Helper {
    
    let indicator = UIActivityIndicatorView()
    
    func loadInd(vc : UIViewController) {
        indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        indicator.style = .gray
        indicator.center = vc.view.center
        vc.view.addSubview(indicator)
    }

    func showActIndicator() {
      
        indicator.startAnimating()
        
    }
    func stop() {
        indicator.stopAnimating()

    }
    
    
}
