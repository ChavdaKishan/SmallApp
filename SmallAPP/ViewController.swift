//
//  ViewController.swift
//  SmallAPP
//
//  Created by iFlame on 7/19/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

struct MyData
{
    var no : Int!
    var name : String!
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var arr = [MyData]()
    var lmod = false
    
    //@IBOutlet weak var SlideView: UIView!
    
    @IBOutlet weak var SlideView: UIView!
    @IBOutlet weak var LeftConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var PopUpView: UIView!
    
    @IBOutlet weak var BtnFB: UIButton!
    @IBOutlet weak var BtnGgle: UIButton!
    @IBOutlet weak var BtnGmail: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        arr = [MyData(no: 1, name: "Home"),
               MyData(no: 2, name: "About Us"),
               MyData(no: 3, name: "Contact Us"),
               MyData(no: 4, name: "Gallery"),
               MyData(no: 5, name: "Help")]
        
        BtnFB.layer.borderWidth = 2
        BtnFB.layer.borderColor = UIColor.black.cgColor
        BtnFB.layer.cornerRadius = BtnFB.frame.size.height / 2
        BtnFB.layer.cornerRadius = BtnFB.frame.size.width / 5
        
        BtnGgle.layer.borderWidth = 2
        BtnGgle.layer.borderColor = UIColor.black.cgColor
        BtnGgle.layer.cornerRadius = BtnGgle.frame.size.height / 2
        BtnGgle.layer.cornerRadius = BtnGgle.frame.size.width / 5
        
        BtnGmail.layer.borderWidth = 2
        BtnGmail.layer.borderColor = UIColor.black.cgColor
        BtnGmail.layer.cornerRadius = BtnGmail.frame.size.height / 2
        BtnGmail.layer.cornerRadius = BtnGmail.frame.size.width / 5
        
        PopUpView.isHidden = true
    }

    @IBAction func LeftClick(_ sender: Any)
    {
        if (lmod)
        {
            LeftConstraints.constant = -700
            animation()
            PopUpView.isHidden = true
        }
        else
        {
            LeftConstraints.constant = 0
            animation()
            PopUpView.isHidden = true
        }
        lmod = !lmod
    }
    
    @IBAction func RightClick(_ sender: Any)
    {
        if (PopUpView.isHidden == true)
        {
            PopUpView.isHidden = false
            LeftConstraints.constant = -700
            animation()
            animation1()
        }
        else
        {
            PopUpView.isHidden = true
            LeftConstraints.constant = -700
            animation()
        }
    }
    
    @IBAction func Facebookclick(_ sender: Any)
    {
        let url = URL(string: "https://www.facebook.com")
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        /*self.performSegue(withIdentifier: "FaceBookVC", sender: self)
        */
    }
    @IBAction func Googleclick(_ sender: Any)
    {
        let url = URL(string: "https://www.google.com")
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        /*self.performSegue(withIdentifier: "GoogleVC", sender: self)
        */
    }
    @IBAction func Gmailclick(_ sender: Any)
    {
        let url = URL(string: "https://www.gmail.com")
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            //If you want handle the completion block than
            UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        }
        /*self.performSegue(withIdentifier: "GmailVC", sender: self)
        */
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.label1.text = arr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if (indexPath.row == 0)
        {
            self.performSegue(withIdentifier: "HomeVC", sender: self)
        }
        else if (indexPath.row == 1)
        {
            self.performSegue(withIdentifier: "AboutUsVC", sender: self)
        }
        else if (indexPath.row == 2)
        {
            self.performSegue(withIdentifier: "ContactUsVC", sender: self)
        }
        else if (indexPath.row == 3)
        {
            self.performSegue(withIdentifier: "GalleryVC", sender: self)
        }
        else
        {
            self.performSegue(withIdentifier: "HelpVC", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animation()
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    func animation1()
    {
        PopUpView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        PopUpView.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.PopUpView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.PopUpView.alpha = 1
        })
    }
}
