//
//  ViewController.swift
//  LinkedIn
//
//  Created by Sierra 4 on 28/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnNextVc: UIButton!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var SideMenu: UIButton!
    var ViewHeader:headerView?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       ViewHeader = UINib(nibName:"headerView",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? headerView
        
        //to drag left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        //register nib ...Xib file registered.
        let nib = UINib(nibName: "homePageFirstTableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "firstcell")
        
        let nibTwo = UINib(nibName: "homePageSecondTableViewCell", bundle: nil)
        tableview.register(nibTwo, forCellReuseIdentifier: "secondcell")
        
        let nib3 = UINib(nibName: "homePageThirdTableViewCell", bundle: nil)
        tableview.register(nib3, forCellReuseIdentifier: "thirdcell")
        
       // self.tableview.contentOffset = CGPoint(x: 0,y: 0 - self.tableview.contentInset.top)


    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
    case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                menuappers(){_ in
                    
                }
                
            default:
                break
            }
        }
    }
    
    //Mark: func to drag tableview left side
    func menuappers(completionHandler:@escaping() -> ())
    {
        let menuVC : sideScreenViewController = self.storyboard!.instantiateViewController(withIdentifier: "sideScreenViewController ") as! sideScreenViewController 
        
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 + UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            
        }, completion:{completed in
            if completed {
                completionHandler()
            }
        })
        
    }

    @IBAction func btnsharepage(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSideMenu(_ sender: UIButton)
    {
        SideMenu.isEnabled = false
        menuappers(){_ in
            self.SideMenu.isEnabled = true
        }

    }
    
}

extension  ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch (indexPath.row)
        {
        case 0:
            
            let firstcell = tableView.dequeueReusableCell(withIdentifier:"firstcell", for: indexPath) as!
            homePageFirstTableViewCell
            //Mark:....for creating view /cell border and shadow.....//
                   firstcell.viewOutlet.layer.shadowColor = UIColor.gray.cgColor
                    firstcell.viewOutlet.layer.shadowOpacity = 1
                    firstcell.viewOutlet.layer.shadowOffset = CGSize(width: 1 , height: 1)
                    firstcell.viewOutlet.layer.shadowRadius = 2
                    firstcell.viewOutlet.layer.cornerRadius = 2
            firstcell.btnlike.tintColor = UIColor.gray
            return firstcell
            
        case 1:
            
            let secondcell = tableView.dequeueReusableCell(withIdentifier:"secondcell", for: indexPath) as!
            homePageSecondTableViewCell
            return secondcell
            
            
        case 2:
            
            let thirdcell = tableView.dequeueReusableCell(withIdentifier: "thirdcell", for: indexPath) as!
            homePageThirdTableViewCell
            return thirdcell
            
            
            
            
        default:
            
            let firstcell = tableView.dequeueReusableCell(withIdentifier:"firstcell", for: indexPath) as!
            homePageFirstTableViewCell
            return firstcell
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
                switch (indexPath.row)
                        {
                        case 0:
                          return 230
                         case 1:
                            return 176
                       case 2:
                           return 193
                        default :
                            return 230
                            
                    }
    }
    

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       btnNextVc.isHidden = false
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        btnNextVc.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ViewHeader
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 40
        }
        else
        {
            return 0
        }
    }
    }
