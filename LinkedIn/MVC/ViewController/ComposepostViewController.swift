//
//  ComposepostViewController.swift
//  LinkedIn
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit

class ComposepostViewController: UIViewController , UIImagePickerControllerDelegate ,UINavigationControllerDelegate {

    @IBOutlet weak var imgshow: UIImageView!
    @IBOutlet weak var btncamera: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnCamera(_ sender: UIButton)
    {
        
        let profileImage = UIImagePickerController()
        profileImage.delegate = self
        
        profileImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
        profileImage.allowsEditing = false
        self.present(profileImage , animated: true) {
            //After Completion
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker : UIImagePickerController , didFinishPickingMediaWithInfo info : [String : Any]) {
        if let  profileImage = info[UIImagePickerControllerOriginalImage] as? UIImage! {
            imgshow.image =  profileImage
        }
        else {
            //error message
        }
        self.dismiss(animated: true
            , completion: nil)
    }

    @IBAction func btnBack(_ sender: UIButton)
    {
          _ = navigationController?.popViewController(animated: true)
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
