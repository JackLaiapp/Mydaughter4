//
//  MydaughterViewController.swift
//  Mydaughter
//
//  Created by MyMac on 2017/3/16.
//  Copyright © 2017年 Jack Lai. All rights reserved.
//

import UIKit

class MydaughterViewController: UIViewController {

    
    @IBOutlet var mainImageView: UIImageView!

    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        imageArray = [#imageLiteral(resourceName: "IMG_3018"),#imageLiteral(resourceName: "DSC_5496"),#imageLiteral(resourceName: "DSC_5536")]
        
            // 設置要輪播的圖片陣列
            mainImageView.animationImages = imageArray
            // 輪播一次的總秒數
            mainImageView.animationDuration = 6
            // 要輪播幾次 (設置 0 則為無限次)
            mainImageView.animationRepeatCount = 0
            // 開始輪播
            mainImageView.startAnimating()
            // 放入畫面中
            self.view.addSubview(mainImageView)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
