//
//  PhotosViewController.swift
//  ios-instagram-feed
//
//  Created by Yayang Tian on 9/14/15.
//  Copyright © 2015 walmartlabs. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var photosTableView: UITableView!

    var photos: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Source
        photosTableView.dataSource = self
        photosTableView.delegate = self
        
        // Size
        self.photosTableView.rowHeight = 320
        
        // Get Instagram data
        let clientId = "c4fc61c4704949baab8825cf178e13fe"
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        
        get(url){result in
            self.photos = result
            self.photosTableView.reloadData()
            NSLog("response count: \(result.count)")
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
    
    // Implementing all required methods for UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.photos?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("com.walmartlabs.PhotoViewCell", forIndexPath: indexPath) as! PhotoViewCell
        
               if let image = UIImage(named: self.photos[indexPath.row] as! String) {
            cell.photoImageView.image = image
        }
        return cell
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
