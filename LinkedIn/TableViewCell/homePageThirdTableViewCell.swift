//
//  homePageThirdTableViewCell.swift
//  LinkedIn
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class homePageThirdTableViewCell: UITableViewCell {
    var tapCount = 1
    @IBOutlet weak var btnlike: UIButton!
    @IBOutlet weak var lblnumoflike: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnLike(_ sender: UIButton) {
        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(self.tapBlurButton(_:)))
        btnlike.addGestureRecognizer(tapGesture)
    }
    
    func tapBlurButton(_ sender: UIButton)
    {
        if(tapCount%2 != 0)
        {   self.btnlike.tintColor = UIColor.blue
            self.lblnumoflike.textColor = UIColor.blue
            UIView.animate(withDuration: 0.3, animations:  {
                self.btnlike.transform = CGAffineTransform(scaleX : 0.3, y: 0.3)},
                           completion: { _ in
                            UIView.animate(withDuration: 0.3)
                            {
                                self.btnlike.transform = CGAffineTransform.identity
                            }
            })
            tapCount = tapCount + 0
            self.lblnumoflike.text = "like"
            tapCount += tapCount
            
        }
        else{
            UIView.animate(withDuration: 0.3, animations:  {
                self.btnlike.transform = CGAffineTransform(scaleX : 0.3, y: 0.3)},
                           completion: { _ in
                            UIView.animate(withDuration: 0.3)
                            {
                                self.btnlike.transform = CGAffineTransform.identity
                                self.btnlike.tintColor = UIColor.gray
                                self.lblnumoflike.textColor = UIColor.gray
                            }
            })
            //            let image = UIImage(named: "like-2.png") as UIImage?
            //            btnlike.setImage(image, for: UIControlState.normal)
            tapCount = tapCount - 1
            self.lblnumoflike.text = "Unlike"
            
            
            
            
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
