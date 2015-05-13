//
//  ARFWikiViewController.swift
//  StarWars
//
//  Created by Alejandro Rodriguez on 5/14/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ARFWikiViewController: UIViewController, UIWebViewDelegate {

    //Graphic Properties
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //Non graphic properties
    var model:StarWarsCharacter?
    
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
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        syncWithModel()
        
    }
    
    
    func syncWithModel(){
        
        if let theName = model?.alias{
            self.title = theName
        }
        else{
            self.title = model?.name
        }
        if let theUrl = model?.url{
            activityIndicator.startAnimating()
            webView.loadRequest(NSURLRequest(URL: theUrl))
        }
       
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked{
            return false
        }
        else{
            return true
        }
    }
}
