//
//  PhotoViewController.swift
//  ios-instagram-feed
//
//  Created by Yayang Tian on 9/14/15.
//  Copyright © 2015 walmartlabs. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photos: NSArray?
    var responseDictionary: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clientId = "c4fc61c4704949baab8825cf178e13fe"
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        
        get(url){result in
            NSLog("response: \(result)")
        }
    }
    
    func get(url: NSURL, completion: (NSArray) -> ()) {
        let request  = NSURLRequest(URL: url)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error: \(error)")
                return
            } else {
                let dict = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                let result = dict["data"] as? NSArray
                completion(result!)
            }
        }
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
