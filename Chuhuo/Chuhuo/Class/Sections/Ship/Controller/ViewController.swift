//
//  ViewController.swift
//  Chuhuo
//
//  Created by JING on 2018/9/11.
//  Copyright © 2018年 JING. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var shipTableView: UITableView!
    
    var age: Int = 33
    var checkRepeat: String = ""
    var dateList: Array = [[Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddBtn.backgroundColor = UIColor.gray
        // 註冊 cell
        shipTableView.register(
            UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // 設置委任對象
        shipTableView.delegate = self
        shipTableView.dataSource = self

        var testArry: Array<Any>

        
        testArry = ["0","test1"]
        dateList.append(testArry)
        testArry = ["0","test2"]
        dateList.append(testArry)
        testArry = ["1","test3"]
        dateList.append(testArry)
        testArry = ["1","test4"]
        dateList.append(testArry)
        testArry = ["1","test5"]
        dateList.append(testArry)
        testArry = ["2","test6"]
        dateList.append(testArry)
        testArry = ["3","test7"]
        dateList.append(testArry)
        testArry = ["3","test8"]
        dateList.append(testArry)
        testArry = ["4","test9"]
        dateList.append(testArry)
        
  
        print(dateList[0][0])
        

        
        
        let testArry123: NSMutableArray = []
        testArry123.add("1")
        testArry123.add("2")
        testArry123.add("3")
        testArry123.add("4")
        testArry123.add("5")
        
        //print(testArry123.index(of: 1))
        
        
        var array2D:[[Int16]] = [
            [0,1,2,3,4],
            [5,6,7,8,9]
        ]
        let ptr2D = UnsafeMutablePointer<[Int16]>(&array2D)
        print(ptr2D[0])     // [0,1,2,3,4]
        print(ptr2D[1])     // [5,6,7,8,9]
        print(ptr2D[1][2])  // 7
        
        
        
        let testInt = 1;
        
        if testInt == 1 {
            print("99")
            
        }
        for x in 0...dateList.count-1{
           print(dateList[x])
        }
        
        //创建一个重用的单元格
        shipTableView!.register(UINib(nibName:"ShipTableViewCell", bundle:nil),
                                    forCellReuseIdentifier:"myCell")
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

 
    @IBAction func clickAddBtn(_ sender: Any) {
        print("test")
        
    }
    /*
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dateList.count
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        print("TEST2:",dateList[indexPath.row][0])
        print("TEST3:",checkRepeat)
        if checkRepeat == "" || checkRepeat !=  dateList[indexPath.row][0] as! String{
            //print(dateList [indexPath.row])
            checkRepeat =  dateList[indexPath.row][0] as! String
        }
        
        let cell:ShipTableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            as! ShipTableViewCell
    
        cell.nameLabel?.text = dateList [indexPath.row] as? String


        return cell
    }
    
    
    // 點選 cell 後執行的動作
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(
            at: indexPath, animated: true)
        print("選擇的是 \( dateList[indexPath.row])")
    }
    
    // 設置 cell 的高度
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath)
        -> CGFloat {
            return shipTableView.frame.size.height/6
    }
}

