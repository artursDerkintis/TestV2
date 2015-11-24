//
//  TextField.swift
//  TestV2
//
//  Created by Arturs Derkintis on 11/23/15.
//  Copyright © 2015 Starfly. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

class TextFieldView: UIView {
    
    var textField : UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField = UITextField(frame: CGRect.zero)
        addSubview(textField!)
        textField?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.right.left.bottom.equalTo(0)
        })
        
        textField?.keyboardType = UIKeyboardType.WebSearch
        
        textField?.addTarget(self, action: "textFieldBegin:", forControlEvents: UIControlEvents.EditingDidBegin)
        textField?.addTarget(self, action: "textFieldReturn:", forControlEvents: UIControlEvents.EditingDidEndOnExit)
        
        //Design details
        textField?.layer.borderWidth = 1
        textField?.backgroundColor = UIColor.whiteColor()
        textField?.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField?.layer.cornerRadius = 10
        textField?.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
        textField?.leftViewMode = .Always
        textField?.font = UIFont.systemFontOfSize(20)

    }
    
    func textFieldBegin(textField : UITextField){
        textField.backgroundColor = .whiteColor()
    }
    
    func textFieldReturn(textField : UITextField){
        
        if let companyName = textField.text?.stringByReplacingOccurrencesOfString(" ", withString: "") where companyName.characters.count > 1{
            
            let request = "https://\(companyName).fusion-universal.com/api/v1/company.json"
            Alamofire.request(.GET, request).response { (request, response, data, error) in
                    
                textField.backgroundColor =  response?.statusCode == 200 ? .greenColor() : .redColor()
                if response?.statusCode == 200{
                    if let data = data{
                        
                        //Creates model of the responce values.
                        let company = Company(jsonData: data)
                        textField.text = company?.name
                        
                    }
                }
            }
        }
    }

    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
