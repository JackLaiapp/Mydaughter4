//
//  MydaughterViewController.swift
//  Mydaughter
//
//  Created by MyMac on 2017/3/16.
//  Copyright © 2017年 Jack Lai. All rights reserved.
//

import UIKit

struct Info{
    
    var label:String = ""
    var image:[String] = []
}

class MydaughterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    
    @IBOutlet var imageTableView: UITableView!
    @IBOutlet weak var HeaderImageView: UIImageView!
    var mainData = [
        Info(label : "１歲", image : ["01.JPG", "02.JPG", "03.JPG", "04.JPG", "05.JPG", "06.JPG", "07.JPG", "08.JPG", "09.JPG", "10.JPG", "11.JPG","12.JPG"]),
        ]
    var imageArray = [#imageLiteral(resourceName: "DSC_5508"),#imageLiteral(resourceName: "DSC_5536"),#imageLiteral(resourceName: "DSC_5528")]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! mainTableViewCell

        
        for i in 0...11 {
            
            cell.mainLabel.text = mainData[indexPath.row].label
            let imageView = UIImageView()
            imageView.image = UIImage(named: mainData[indexPath.row].image[i])
            cell.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y : 0, width : cell.mainScrollView.frame.width, height: cell.mainScrollView.frame.height)
            
            cell.mainScrollView.contentSize.width = cell.mainScrollView.frame.width * CGFloat(i + 1)
            cell.mainScrollView.addSubview(imageView)

        }


        return cell
        
    }

    
override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Do any additional setup after loading the view.
        // 設置要輪播的圖片陣列
        self.HeaderImageView.animationImages = imageArray
        // 輪播一次的總秒數
        self.HeaderImageView.animationDuration = 6
        // 要輪播幾次 (設置 0 則為無限次)
        self.HeaderImageView.animationRepeatCount = 0
        // 開始輪播
        self.HeaderImageView.startAnimating()


    
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
