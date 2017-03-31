//
//  MydaughterViewController.swift
//  Mydaughter
//
//  Created by MyMac on 2017/3/16.
//  Copyright © 2017年 Jack Lai. All rights reserved.
//

import UIKit

class Info{
    
    var title = ""
    var image = [""]
    var location = ""
    
    init(title: String, image:[String], location: String){
        self.title = title
        self.image = image
        self.location = location
        
    }
}
class MydaughterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate{

    @IBOutlet var imageTableView: UITableView!
    @IBOutlet weak var HeaderImageView: UIImageView!
    var daughterdata:[Info] = [
        Info(title : "1個月", image : ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"], location: ""),
        Info(title : "2個月", image : ["6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"], location: ""),
        Info(title : "3個月", image : ["11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg"],location: ""),
        Info(title : "4個月", image : ["16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg"],location: ""),
        Info(title : "5個月", image : ["21.jpg", "22.jpg", "23.jpg", "24.jpg", "25.jpg"],location: ""),
        Info(title : "6個月", image : ["26.jpg", "27.jpg", "28.jpg", "29.jpg", "30.jpg"],location: ""),
        Info(title : "7個月", image : ["31.jpg", "32.jpg", "33.jpg", "34.jpg", "35.jpg"],location: ""),
        Info(title : "8個月", image : ["36.jpg", "37.jpg", "38.jpg", "39.jpg", "40.jpg"],location: "")]


    var imageArray = [#imageLiteral(resourceName: "peter"),#imageLiteral(resourceName: "DSC_5508"),#imageLiteral(resourceName: "DSC_5536"),#imageLiteral(resourceName: "DSC_5528")]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daughterdata.count
    }

    // 設定  cell  的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! mainTableViewCell
        // Configure the cell...
        let dic = daughterdata[indexPath.row]
        cell.mainLabel.text = dic.title
        
        // 在ScrollView 產生 button
        for i in 0..<dic.image.count {

            let button = UIButton()
            button.setImage(UIImage(named: dic.image[i]), for: .normal)
            
            let xPosition = cell.mainScrollView.frame.width * CGFloat(i)
            button.frame = CGRect(x: xPosition, y: 0, width : (cell.mainScrollView.frame.width - 10), height: cell.mainScrollView.frame.height)
            
            button.tag = i
            //設定button邊界顏色和大小

            button.layer.masksToBounds = true
            button.layer.cornerRadius = 10
            button.layer.backgroundColor = UIColor.white.cgColor
            button.addTarget(self, action: #selector(goDetailController(sender:)), for: .touchUpInside)
            button.setTitle(dic.title, for: .normal)
            cell.mainScrollView.contentSize.width = cell.mainScrollView.frame.width * CGFloat(i + 1)
            //是否顯示水平的滑動條
            cell.mainScrollView.showsHorizontalScrollIndicator = false
            //解決botton無法實現scrollview滑動
            cell.mainScrollView.panGestureRecognizer.delaysTouchesBegan = true
            
            cell.mainScrollView.addSubview(button)
            
      }

        return cell
        
    }
    
    func goDetailController(sender: UIButton){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        controller?.titleLabel = sender.currentTitle
        controller?.tag = sender.tag
        print(sender.tag)
        controller?.image = sender.currentImage
        
        self.present(controller!, animated: true, completion: nil)
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailetailViewController" {
            if let indexPath = imageTableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.info = daughterdata[indexPath.row]
            }
        }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        imageTableView.delegate = self
    
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
