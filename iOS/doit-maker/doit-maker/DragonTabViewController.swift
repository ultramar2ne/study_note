//
//  DragonTabViewController.swift
//  doit-maker
//
//  Created by Jinwook Choi on 2023/07/11.
//

import UIKit

class DragonTabViewController: UIViewController {
    
    var imageFileName = ["1.png","2.png","3.png"]
    
    @IBOutlet var imgImageView: UIImageView!
    
    @IBOutlet var olPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgImageView.image = UIImage(named: "resource/im_cornflower.png")
        
        olPageControl.numberOfPages = imageFileName.count
        
        olPageControl.currentPage = 0
        
        olPageControl.pageIndicatorTintColor = UIColor.blue
        
        olPageControl.currentPageIndicatorTintColor = UIColor.yellow
        
    }
    
    
    // page value 값 변경시 호출.. ?
    @IBAction func acPageControl(_ sender: UIPageControl) {
        imgImageView.image = UIImage(named: "resource/picker/" + imageFileName[olPageControl.currentPage])
    }
    
}
