//
//  ARFCharacterViewController.swift
//  StarWars
//
//  Created by Alejandro Rodriguez on 5/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ARFCharacterViewController: UIViewController {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var lblCharacter: UILabel!
    
    
    
    var model:StarWarsCharacter?
    var player:CafPlayer?
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!, model :StarWarsCharacter) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.model = model
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        navigationController?.navigationBar.translucent = false
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        syncModel()
    }
    
    func syncModel(){
        imgCharacter.image = model?.image
        if let theName = model?.alias{
            lblCharacter.text = theName
            self.title = theName
        }
        else
        {
            lblCharacter.text = model?.name
            self.title = model?.name
        }
    }
    
    
    @IBAction func didTapWiki(sender: AnyObject) {
        
        var wikiVC:ARFWikiViewController = ARFWikiViewController(nibName: "ARFWikiViewController", bundle: nil, model: self.model!)
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @IBAction func didTapSound(sender: AnyObject) {
        
        player = CafPlayer.cafPlayer() as? CafPlayer
        player?.playSoundData(model?.soundData)
        
    }
    
    
    
    
}
