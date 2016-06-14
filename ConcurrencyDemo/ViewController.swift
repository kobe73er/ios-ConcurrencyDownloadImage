//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg", "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

var queue = NSOperationQueue()


class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        return UIImage(data: data!)
    }
}



class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @IBAction func didClickOnStart(sender: AnyObject) {
    //
    //        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
    //        self.imageView1.image = img1
    //
    //        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
    //        self.imageView2.image = img2
    //
    //        let img3 = Downloader.downloadImageWithURL(imageURLs[2])
    //        self.imageView3.image = img3
    //
    //        let img4 = Downloader.downloadImageWithURL(imageURLs[3])
    //        self.imageView4.image = img4
    //
    //    }
    /**
     This version Using Concurrent Dispatch Queues
     we got 4 types of concurrent dispatch queues
     DISPATCH_QUEUE_PRIORITY_HIGH
     DISPATCH_QUEUE_PRIORITY_DEFAULT
     DISPATCH_QUEUE_PRIORITY_LOW
     DISPATCH_QUEUE_PRIORITY_BACKGROUND
     */
    
    //    @IBAction func didClickOnStart(sender: AnyObject) {
    //
    //        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    //
    //
    //        dispatch_async(queue){()-> Void in
    //
    //            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
    //
    //            dispatch_async(dispatch_get_main_queue(), {self.imageView1.image=img1})
    //        }
    //
    //        dispatch_async(queue) { () -> Void in
    //
    //            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
    //
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView2.image = img2
    //            })
    //
    //        }
    //        dispatch_async(queue) { () -> Void in
    //
    //            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
    //
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView3.image = img3
    //            })
    //
    //        }
    //        dispatch_async(queue) { () -> Void in
    //
    //            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
    //
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView4.image = img4
    //            })
    //        }
    //    }
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
    
    
    /**
     This version we Using Serial Dispatch Queues
     use the function dispatch_queue_create to create a new queue
     NOTE:
     1.It take a bit long to download the images, as compared to the case of concurrent queue. The reason is that we only load one image at a time. Each task waits for the previous task to finish before being executed.
     2.Images are loaded in order image1, image2, image3, and image4. That’s because the queue is a serial queue that executes one task a time.
     */
    //    @IBAction func didClickOnStart(sender: AnyObject) {
    //        let serialQueue = dispatch_queue_create("com.appcoda.imagesQueue", DISPATCH_QUEUE_SERIAL)
    //
    //
    //        dispatch_async(serialQueue) { () -> Void in
    //
    //            let img1 = Downloader .downloadImageWithURL(imageURLs[0])
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView1.image = img1
    //            })
    //
    //        }
    //        dispatch_async(serialQueue) { () -> Void in
    //
    //            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
    //
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView2.image = img2
    //            })
    //
    //        }
    //        dispatch_async(serialQueue) { () -> Void in
    //
    //            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
    //
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView3.image = img3
    //            })
    //
    //        }
    //        dispatch_async(serialQueue) { () -> Void in
    //
    //            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
    //
    //            dispatch_async(dispatch_get_main_queue(), {
    //
    //                self.imageView4.image = img4
    //            })
    //        }
    //    }
    
    /**
     using nsoperation queue
     */
    //    @IBAction func didClickOnStart(sender: AnyObject) {
    //         queue = NSOperationQueue()
    //        queue.addOperationWithBlock{()->Void in
    //            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
    //
    //            NSOperationQueue.mainQueue().addOperationWithBlock({
    //                self.imageView1.image = img1
    //            })
    //        }
    //
    //        queue.addOperationWithBlock { () -> Void in
    //            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
    //
    //            NSOperationQueue.mainQueue().addOperationWithBlock({
    //                self.imageView2.image = img2
    //            })
    //
    //        }
    //
    //        queue.addOperationWithBlock { () -> Void in
    //            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
    //
    //            NSOperationQueue.mainQueue().addOperationWithBlock({
    //                self.imageView3.image = img3
    //            })
    //
    //        }
    //
    //        queue.addOperationWithBlock { () -> Void in
    //            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
    //
    //            NSOperationQueue.mainQueue().addOperationWithBlock({
    //                self.imageView4.image = img4
    //            })
    //
    //        }
    //    }
    
    
    @IBAction func didClickOnStart(sender: AnyObject) {
        
        queue = NSOperationQueue()
        let operation1 = NSBlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView1.image = img1
            })
        })
        
        operation1.completionBlock = {
            print("Operation 1 completed")
        }
        queue.addOperation(operation1)
        
        let operation2 = NSBlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView2.image = img2
            })
        })
        
        operation2.completionBlock = {
            print("Operation 2 completed")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = NSBlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView3.image = img3
            })
        })
        
        operation3.completionBlock = {
            print("Operation 3 completed")
        }
        queue.addOperation(operation3)
        
        let operation4 = NSBlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.imageView4.image = img4
            })
        })
        
        operation4.completionBlock = {
            print("Operation 4 completed")
        }
        queue.addOperation(operation4)
    }
    
}

