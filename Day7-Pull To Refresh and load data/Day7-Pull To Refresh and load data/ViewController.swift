//
//  ViewController.swift
//  Day7-Pull To Refresh and load data
//
//  Created by 孔凡列 on 16/7/13.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView : UITableView!
    
    var refreshControl : UIRefreshControl = UIRefreshControl()

    var modelArr : NSMutableArray = NSMutableArray()
    
    var refreshing: Bool = false {
        didSet {
            if (self.refreshing) {
                self.refreshControl.beginRefreshing()
                self.refreshControl.attributedTitle = NSAttributedString(string: "Loading")
                print("Loading...")
            }
            else {
                
                self.refreshControl.endRefreshing()
                self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
                print("Loaded & set:Pull to Refresh")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        tableView = UITableView.init(frame: view.bounds, style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.registerNib(UINib.init(nibName: "FLTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        refreshControl.addTarget(self, action: Selector.init("pull"), forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.addSubview(refreshControl)
        refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        setupData()
        
    }
    
    func pull() {
        print("hello world")
        
        refreshing = true
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(4.0)), dispatch_get_main_queue()) { () -> Void in
            self.setupData()

            self.refreshing = false
            
            print(self.modelArr.count)
        }
    }
    
    func setupData() {
        let params0 : Dictionary<String,String> = ["name" : "IMG_1517"]
//        let params1 : Dictionary<String,String> = ["name" : "hello"]
//        let params2 : Dictionary<String,String> = ["name" : "bodyline"]
//        let params3 : Dictionary<String,String> = ["name" : "hhhhh"]
        
        let model0 : FLModel = FLModel.init(dict: params0)
//        let model1 : FLModel = FLModel.init(dict: params1)
//        let model2 : FLModel = FLModel.init(dict: params2)
//        let model3 : FLModel = FLModel.init(dict: params3)
        
        modelArr.addObject(model0)
//        modelArr.addObject(model1)
//        modelArr.addObject(model2)
//        modelArr.addObject(model3)
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! FLTableViewCell
        cell.model = modelArr[indexPath.row] as! FLModel
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
}

