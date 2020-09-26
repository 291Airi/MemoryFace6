//
//  ViewController.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2019/11/09.
//  Copyright © 2019 福井　愛梨. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var test: UIButton!
    
    private var realm: Realm!
    var todoItem: Results<personArray>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 永続化されているデータを取りだす
                  let persons = List<personArray>()
                  
                  do{
                      let realm = try Realm()
                      todoItem = realm.objects(personArray.self)
                      
                      //tableView.reloadData()
                      super.viewDidLoad()
                  }catch{

                  }

           // (1)Realmのインスタンスを生成する
                      let realm1 = try! Realm()
                  // (2)全データの取得
                      let results = realm1.objects(personArray.self)
                  // (3)取得データの確認
                      print(results)
                // 取得件数の表示
                    print("results\(results.count)")
        
        if results.count == 0{
            test.isHidden = true
        }else{
            test.isHidden = false
        }
    }

}

