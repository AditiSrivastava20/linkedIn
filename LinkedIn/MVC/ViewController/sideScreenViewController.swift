//
//  sideScreenViewController.swift
//  LinkedIn
//
//  Created by Sierra 4 on 28/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class sideScreenViewController: UIViewController {
    var viewfooter:footerView?
    
    var array :[[String]] = [["Job Search","LinkedIn Learning","Lookup",
                             "Slidesare"]]
    var arraytwo :[[String]] = [["Find a job you love","Gain new skills","Find your coworkers", "Master new topics"]]

    var arrayimage :[[String]] = [["jobsearch","learning","lookup",
                                  "slideshare"]]
    
    var menuheader = ["expand your collection"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewfooter = UINib(nibName:"headerView",bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? footerView
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let viewMenuBack : UIView = view
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var frameMenu : CGRect = viewMenuBack.frame
            frameMenu.origin.x = 1 * UIScreen.main.bounds.size.width
            viewMenuBack.frame = frameMenu
            viewMenuBack.layoutIfNeeded()
            viewMenuBack.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            viewMenuBack.removeFromSuperview()
        })
        
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
extension sideScreenViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
      
       return array[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell: SideFirstTableViewCell = tableView.dequeueReusableCell(withIdentifier: "sideFirstcell", for: indexPath) as?  SideFirstTableViewCell else{ return  SideFirstTableViewCell()}
        cell.lblTitle.text = array[indexPath.section][indexPath.row]
         cell.lblDescription.text = arraytwo[indexPath.section][indexPath.row]
        cell.imgDetails.image = UIImage(named:arrayimage[indexPath.section][indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return array.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 16, y: -5, width: tableView.frame.size.width, height: 40))
        label.text = "Expand your collection"
        label.textColor = UIColor.gray
        label.textAlignment = .left
        
        label.font = UIFont.boldSystemFont(ofSize: 11.0)
        
        let viewheader = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: 4))
        viewheader.backgroundColor = UIColor.white
        
        
        viewheader.addSubview(label)
        return viewheader
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = menuheader[section]
        
        print(menuheader[section])
        return title
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewfooter
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
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
