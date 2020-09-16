//
//  ChoiceViewController.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2020/07/16.
//  Copyright © 2020 福井　愛梨. All rights reserved.
//

import UIKit
import RealmSwift

class ChoiceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    var todoItem: Results<personArray>!

    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 永続化されているデータを取りだす

        let persons = List<personArray>()


        do{
            let realm = try Realm()
            todoItem = realm.objects(personArray.self)
            //tableView.reloadData()
            super.viewDidLoad()
        }catch{

        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tableView.reloadData()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return todoItem.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath)->UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")

        let object = todoItem[indexpath.row]

        cell.textLabel?.text = object.textFieldString
        return cell
    }

    // TableViewのCellの削除を行った際に、Realmに保存したデータを削除する
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {


        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.todoItem[indexPath.row])
                }
                tableView.deleteRows(at:[IndexPath], with: UITableView.RowAnimation.Fade)
            }catch{
            }
            tableView.reloadData()
        }
    }
}





//import UIKit
//import RealmSwift
//
//class ChoiceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
//
//    private var realm: Realm!
//
//    @IBOutlet weak var table: UITableView!
//
//    //名前を入れるための配列
//    var NameArray = [String]()
//
//    //写真を入れるための配列
//    var imageNameArray = [String]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        table.dataSource = self
//
//        table.delegate = self
//
//        // (1)Realmのインスタンスを生成する
//               let realm2 = try! Realm()
//        // (2)全データの取得
//               let results = realm2.objects(personArray.self)
//        // (3)取得データの確認
//               print(results)
//
//
//       //NameArray,imageNameArrayに名前を入れる
//        NameArray = [results[0].textFieldString]
//        imageNameArray = [results[0].pictureurl]
//
//    }
//
//    //セルの数を設定
//    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
//        return NameArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//
//        //セルに画像を表示する
//        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
//
//        //セルにNameArrayを表示する
//        cell?.textLabel?.text = NameArray[indexPath.row]
//
//        return cell!
//    }
//
//    //セルが押された時に呼ばれるメソッド
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            print("\(NameArray[indexPath.row])が選ばれました")
//        // (1)Realmのインスタンスを生成する
//            let realm2 = try! Realm()
//        // (2)全データの取得
//            let results = realm2.objects(personArray.self)
//        // (3)取得データの確認
//            print(results)
//        try! realm.write {
//            realm.delete(results)
//            // (1)Realmのインスタンスを生成する
//                let realm2 = try! Realm()
//            // (2)全データの取得
//                let results = realm2.objects(personArray.self)
//            // (3)取得データの確認
//                print(results)
//
//        }
//
//
//        //スワイプしたセルを削除
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            NameArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//        }
//
//
//    }
//
//    //セルの編集許可
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
//        return true
//    }
//
//
//}
