

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let urlString = "https://wpnature.com/wp-content/uploads/2017/02/beach-hanalei-bay-kaua-hawaii-ocean-lagoon-sand-escape-pool-polynesia-kauai-fantasy-holiday-tropical-honeymoon-sea-animated-wallpaper-windows-7.jpg"
    
    var url:NSURL!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = NSURL(string: urlString)
        indicator.startAnimating()
        indicator.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func downloadBtnTapped(_ sender: Any) {
  
       // let data = NSData(contentsOf: url as URL)
      //  self.imageView.image = UIImage(data: data as! Data)
        
        
        indicator.isHidden = false
        URLSession.shared.dataTask(with: (url as URL), completionHandler: {(data, resp, error) -> Void in
            if (error == nil && data != nil) {
               // DispatchQueue.main.async(execute: { self.imageView.image = UIImage(data: data!)
              //})
                
                OperationQueue.main.addOperation ({
                    
                    self.indicator.isHidden = true
                    self.imageView.image = UIImage(data: data!)
                })
            }
        }).resume()
                
        }
}
