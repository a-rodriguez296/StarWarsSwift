//
//  StarWarsCharacter.swift
//  StarWarsSwift
//
//  Created by Alejandro Rodriguez on 5/11/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class StarWarsCharacter: NSObject {
    
    
    var name : String = ""
    var alias : String?
    var image : UIImage?
    var soundData : NSData?
    var url : NSURL?
    
    
    //Inits
    override init() {} //Default Init
    
    
    init(name: String, alias: String, image: UIImage, soundData : NSData, url : NSURL){
        self.name = name;
        self.alias = alias;
        self.image = image
        self.soundData = soundData
        self.url = url
    }
    
    
    init(alias: String, image: UIImage, soundData : NSData, url : NSURL){
        self.name = "";
        self.alias = alias;
        self.image = image
        self.soundData = soundData
        self.url = url
    }
    
    
   
}
