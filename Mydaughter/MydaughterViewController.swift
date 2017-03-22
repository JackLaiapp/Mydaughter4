//
//  MydaughterViewController.swift
//  Mydaughter
//
//  Created by MyMac on 2017/3/16.
//  Copyright © 2017年 Jack Lai. All rights reserved.
//

import UIKit


class MydaughterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet var imageTableView: UITableView!
    @IBOutlet weak var HeaderImageView: UIImageView!

    var mainData = [["label":"0-6個月"],["label":"7-12個月"]]
    
    var myImages = [[#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "6")],[#imageLiteral(resourceName: "7"),#imageLiteral(resourceName: "8"),#imageLiteral(resourceName: "9"),#imageLiteral(resourceName: "10"),#imageLiteral(resourceName: "11"),#imageLiteral(resourceName: "12")]]


    var imageArray = [#imageLiteral(resourceName: "peter"),#imageLiteral(resourceName: "DSC_5508"),#imageLiteral(resourceName: "DSC_5536"),#imageLiteral(resourceName: "DSC_5528")]
    //建立一個ImagePickerController
    let imagePicker = UIImagePickerController()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainData.count
    }

    // 設定  cell  的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! mainTableViewCell
        // Configure the cell...
        let dic = mainData[indexPath.row]
        cell.mainLabel.text = dic["label"]
        
        // 在ScrollView 產生 button
        for i in 0..<myImages[indexPath.row].count {
            
            let button = UIButton()
            button.setImage(myImages[indexPath.row][i], for: .normal)
            
            let xPosition = self.view.frame.width * CGFloat(i)
            button.frame = CGRect(x: xPosition, y: 0, width : cell.mainScrollView.frame.width, height: cell.mainScrollView.frame.height)
            
            button.tag = i
            //設定button邊界顏色和大小
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 4
            
            button.addTarget(self, action: #selector(MydaughterViewController.choosePicture), for: .touchUpInside)
            
            cell.mainScrollView.contentSize.width = cell.mainScrollView.frame.width * CGFloat(i + 1)
            //是否顯示水平的滑動條
            cell.mainScrollView.showsHorizontalScrollIndicator = false
            //解決botton無法實現scrollview滑動
            cell.mainScrollView.panGestureRecognizer.delaysTouchesBegan = true
            
            cell.mainScrollView.addSubview(button)
            
      }

        return cell
        
    }
    
    func choosePicture(){
        // 設置拍照完後 可以編輯 會多一個編輯照片的步驟
        imagePicker.allowsEditing = false
        // 設定影像來源 這裡設定為圖庫
        imagePicker.sourceType = .photoLibrary
        // 顯示圖庫功能
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 取得原始拍照的照片 UIImage
        let picker:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
         // 再來就是對圖片的處理 img 是一個 UIImage
        //button.setImage(picker, for: .normal)
        //移除Picker
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // 設置 delegate
        imagePicker.delegate = self
        
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
