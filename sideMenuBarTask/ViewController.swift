//
//  ViewController.swift
//  sideMenuBarTask
//
//  Created by Sohail Binanzala on 26/11/19.
//  Copyright © 2019 Sohail Binanzala. All rights reserved.
//

import UIKit
var sideMenuView:UIView!


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
var myTableView:UITableView!
    
    var barBtn:UIBarButtonItem!
    var display = true
    
    var details = ["Profile", "DailyStatus","DashBoard","Attendance Details","Task","Create a Request","Apply Leave","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    navigationItem.title = "Menu"
        
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"1"), style: .plain, target: self, action: #selector(addTapped))
       
        DisplayView()
//print(".................................................")
print("........................////.........................")
   MyTableViewDisplay()
       
        // Do any additional setup after loading the view.
    }

    
    func DisplayView ()
    {
    
      sideMenuView = UIView(frame: CGRect(x: 0, y: 90, width: 250, height: 385))
        sideMenuView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    

    }
    
    @objc func addTapped()
    {
        if(display)
        {
            view.addSubview(sideMenuView)
            
            display = false
        }else
        
        {
            sideMenuView.removeFromSuperview()
            display = true
        }
      
        
    }
    
    
    func MyTableViewDisplay()
    {
       
        myTableView = UITableView(frame: sideMenuView.bounds, style: UITableView.Style.plain)
        myTableView.delegate=self
        myTableView.dataSource=self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.separatorColor = UIColor.clear
        sideMenuView.addSubview(myTableView)
        
        
    }
    
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return  details.count
        
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = "\(details[indexPath.row])"
        cell.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        cell.textLabel?.font = .italicSystemFont(ofSize: 20)
        
        cell.selectionStyle = .none
        return cell
      }
}

