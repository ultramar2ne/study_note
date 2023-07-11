//
//  ViewControllerDouble.swift
//  doit-maker
//
//  Created by Jinwook Choi on 2023/07/11.
//

import UIKit

class ViewControllerDouble: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var imageFilePath = "resource/picker/1.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "resource/picker/1.png")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! ViewControllerDoubleDouble
//        if segue.identifier ==  ??
        
        editViewController.currentImageFilePath = imageFilePath
           
        
    }
    
    @IBAction func onClickGoFirstView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func onClickGoDragonView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func onClickEditButton(_ sender: UIButton) {
        
    }
}
    
    
