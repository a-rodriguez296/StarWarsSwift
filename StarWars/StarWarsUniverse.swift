//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Alejandro Rodriguez on 5/11/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class StarWarsUniverse: NSObject {
    
    var imperials = []
    var rebels = []
    
    
    override init() {
    
        //Vader
        var vaderURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")
        var bundle = NSBundle.mainBundle()
        var vaderSound = NSData(contentsOfURL: bundle.URLForResource("vader", withExtension: "caf")!)
        var vaderImage = UIImage(named: "darthVader.jpg")
        var vader = StarWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", image: vaderImage!, soundData: vaderSound!, url: vaderURL!)
        
        //Tarkin
        var tarkinURL = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin")
        var tarkinSound = NSData(contentsOfURL: bundle.URLForResource("tarkin", withExtension: "caf")!)
        var tarkinImage = UIImage(named: "tarkin.jpg")
        var tarkin = StarWarsCharacter(name: "Wilhuf Tarkin", alias: "Tarkin", image: tarkinImage!, soundData: tarkinSound!, url: tarkinURL!)
        
        
        // Palpatine
        var palpatineURL = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine")
        var palpatineSound = NSData(contentsOfURL: bundle.URLForResource("palpatine", withExtension: "caf")!)
        var palpatineImage = UIImage(named: "palpatine.jpg")
        var palpatine = StarWarsCharacter(name: "Palpatine", alias: "Darth Sidious", image: palpatineImage!, soundData: palpatineSound!, url: palpatineURL!)
        
        
        // Chewbacca
        var chewbaccaURL = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")
        var chewbaccaSound = NSData(contentsOfURL: bundle.URLForResource("chewbacca", withExtension: "caf")!)
        var chewbaccaImage = UIImage(named: "chewbacca.jpg")
        var chewbacca = StarWarsCharacter(alias: "Chewbacca", image: chewbaccaImage!, soundData: chewbaccaSound!, url: chewbaccaURL!)
        
        
        // C-3PO
        var c3poURL = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")
        var c3poSound = NSData(contentsOfURL: bundle.URLForResource("c3po", withExtension: "caf")!)
        var c3poImage = UIImage(named: "c3po.jpg")
        var c3po = StarWarsCharacter(alias: "C-3PO", image: c3poImage!, soundData: c3poSound!, url: c3poURL!)
        
        // Yoda
        var yodaURL = NSURL(string: "http://en.wikipedia.org/wiki/Yoda")
        var yodaSound = NSData(contentsOfURL: bundle.URLForResource("yoda", withExtension: "caf")!)
        var yodaImage = UIImage(named: "yoda.jpg")
        var yoda = StarWarsCharacter(alias: "Yoda", image: yodaImage!, soundData: yodaSound!, url: yodaURL!)
        
        
        // R2-D2
        var r2d2URL = NSURL(string: "http://en.wikipedia.org/wiki/R2-D2")
        var r2d2Sound = NSData(contentsOfURL: bundle.URLForResource("r2-d2", withExtension: "caf")!)
        var r2d2Image = UIImage(named: "R2-D2.jpg")
        var r2d2 = StarWarsCharacter(alias: "R2-D2", image: r2d2Image!, soundData: r2d2Sound!, url: r2d2URL!)
        
        
        imperials = [vader, palpatine, tarkin]
        rebels = [chewbacca, c3po, yoda, r2d2]
    
    }
    
    // MARK: Accessors
    
    func rebelAtIndex(index: Int) ->StarWarsCharacter{
        return rebels[index] as! StarWarsCharacter
    }
    
    func imperialAtIndex(index: Int) ->StarWarsCharacter{
        return imperials[index] as! StarWarsCharacter
    }
    
    
    
    
   
}
