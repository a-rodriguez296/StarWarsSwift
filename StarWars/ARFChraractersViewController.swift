//
//  ARFChraractersViewController.swift
//  StarWars
//
//  Created by Alejandro Rodriguez on 5/13/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ARFChraractersViewController: UIViewController {
    
    
    
    struct CharacterType {
        static let rebels = 0
        static let imperials = 1
        
        
    }
    
    //Graphic Properties
    @IBOutlet weak var tableView: UITableView!
    
    
    //Non graphic properties
    var model : StarWarsUniverse?
    
    let lastUserRow = "LastUserRow"
    let lastUserSection = "LastUserSection"
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!, model :StarWarsUniverse) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.model = model
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.registerNib(UINib(nibName:NSStringFromClass(ARFTableViewCell.self), bundle: nil), forCellReuseIdentifier: NSStringFromClass(ARFTableViewCell.self))
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        var section:Int? = userDefaults.objectForKey(lastUserSection) as? Int
        var row:Int? = userDefaults.objectForKey(lastUserRow) as? Int
        if let theRow = row, theSection = section{
            tableView.selectRowAtIndexPath(NSIndexPath(forRow: theRow, inSection: theSection), animated: true, scrollPosition: UITableViewScrollPosition.Top)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.title = "Star Wars Universe"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Opción celda del sistema
        
        //        let cellID = "cell"
        //        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? UITableViewCell
        //        if let theCell = cell{}
        //        else{
        //            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID) as UITableViewCell
        //        }
        //
        //        cell?.textLabel?.text = "Hola"
        //        return cell!
        
        //Opción celda personalizada
        
        var cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(ARFTableViewCell.self), forIndexPath: indexPath) as! ARFTableViewCell
        
        
        var currentCharacter:StarWarsCharacter
        if indexPath.section == CharacterType.rebels{
            currentCharacter = model?.rebels[indexPath.row] as! StarWarsCharacter
            cell.lblCharacterName.text = currentCharacter.alias
        }
        else
        {
            currentCharacter = model?.imperials[indexPath.row] as! StarWarsCharacter
            cell.lblCharacterName.text = currentCharacter.name
        }
        
        cell.imgCharacter.image = currentCharacter.image
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == CharacterType.rebels ? model!.rebels.count :  model!.imperials.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 2;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        //Guardar Coordenadas
        var userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(indexPath.row, forKey: lastUserRow)
        userDefaults.setObject(indexPath.section, forKey: lastUserSection)
        userDefaults.synchronize()
        
        var currentCharacter: StarWarsCharacter = (indexPath.section == CharacterType.rebels) ? (model?.rebels[indexPath.row] as! StarWarsCharacter) : (model?.imperials[indexPath.row] as! StarWarsCharacter)
        navigationController?.pushViewController(ARFCharacterViewController(nibName: "ARFCharacterViewController", bundle: nil,model: currentCharacter), animated: true)
    }
    
    func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String?{
            return section == CharacterType.rebels ? "Rebels" :  "Imperials"
    }
    
    
}
