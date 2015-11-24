//
//  Company.swift
//  TestV2
//
//  Created by Arturs Derkintis on 11/23/15.
//  Copyright © 2015 Starfly. All rights reserved.
//

import UIKit

struct Company {
    
    var name: String?
    var logo: String?
    var customColor: String?
    var passwordChanging: [String : AnyObject]?
    var passwordChangingEnabled : Bool?
    var passwordChangingSecureField : String?
    
    /**
     Generates Company model
     */
    init?(jsonData : NSData){
        do {
            let dictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments)
            guard
                let name = dictionary["name"] as? String
                else {return nil}
            
            self.name = name
            self.logo = dictionary["logo"] as? String
            self.customColor = dictionary["custom_color"] as? String
            self.passwordChanging = dictionary["password_changing"] as? [String : AnyObject]
            self.passwordChangingEnabled = self.passwordChanging?["enabled"] as? Bool
            self.passwordChangingSecureField = self.passwordChanging?["secure_field"] as? String

        }catch{
            print("Error \(error)")
        }
        
    }

}

