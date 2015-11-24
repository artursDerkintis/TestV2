//
//  ViewController.swift
//  TestV2
//
//  Created by Arturs Derkintis on 11/23/15.
//  Copyright © 2015 Starfly. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFieldView = TextFieldView(frame: CGRect.zero)
        view.addSubview(textFieldView)
        textFieldView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(60)
            make.right.left.equalTo(0)
            make.height.equalTo(44)
        }
                
    }
    
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
