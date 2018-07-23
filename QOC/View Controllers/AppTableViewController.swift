//
//  AppTableViewController.swift
//  QOC
//
//  Created by Joellyoun Rajendram on 2018-07-20.
//  Copyright © 2018 Joellyoun Rajendram. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController {
    
    var appList: ApplicationList? = nil
    var indicatorView: UIActivityIndicatorView!
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.LabelText.kMainNavTitle
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        setUpIndicator()
    
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.backgroundColor = UIColor.white
        self.refreshControl!.tintColor = UIColor.gray
        let attributedText = NSMutableAttributedString(string: Constants.LabelText.kRefreshLabel)
        attributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.gray, range: NSMakeRange(0, attributedText.length))
        self.refreshControl!.attributedTitle = attributedText
        self.refreshControl!.addTarget(self, action: #selector(getData), for: .valueChanged)
        
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let appList = self.appList {
            return appList.apps.count
        }else {
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.kAppItemCellIdentifier, for: indexPath) as! AppItemCell
        if let data = appList?.apps[indexPath.row] {
            cell.appTitle.text = DataParsingUtil.extractTitle(data: data)
            cell.appImage.setRounded()
            Util.loadImage(url: DataParsingUtil.extractImageURL(data: data, size: Constants.Misc.kIconImageSize), imageView: cell.appImage)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.kAppDetailsViewController, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifiers.kAppDetailsViewController {
            if let indexPath = tableView.indexPathForSelectedRow, let appList = self.appList {
                let destinationViewController = segue.destination as! AppDetailsViewController
                destinationViewController.app = Application(data: appList.apps[indexPath.row])
            }
        }
    }
    
    /// Setting up an activity indicator to be displayed while the data is being loaded.
    func setUpIndicator() {
        tableView.backgroundView = activityIndicatorView
        self.indicatorView = activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    /// Stopping the activity indicator once the table has been loaded.
    func stopIndicator() {
        DispatchQueue.main.async {
            if self.activityIndicatorView.isAnimating {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    /// Stopping The refresh control and its animation.
    func stopRefreshing() {
        DispatchQueue.main.async {
            if self.refreshControl!.isRefreshing {
                self.refreshControl!.endRefreshing()
            }
        }
    }
    
    //Loading the data into the tableview controller and stopping the activity indicator and refresh control.
    func loadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopRefreshing()
            self.stopIndicator()
        }
        
    }
    
    
    /// Getting the list of top 100 apps from the appstore through an API call. Reloading the table data, and presentng any required error messages.
    @objc func getData(){
        NetworkUtil.getData(responseHandler: { (data : Data?, response : URLResponse?, error : Error?) -> Void in
            if error != nil {
                
                self.alert(message: "Error fetching data.", title: "Error", completion: {() -> Void in
                    self.stopIndicator()
                    self.stopRefreshing()
                })
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        self.appList = ApplicationList(data: json)
                        self.loadData()
                    }
                    
                } catch {
                    self.alert(message: "Error fetching data.", title: "Error", completion: {() -> Void in
                        self.stopIndicator()
                        self.stopRefreshing()
                    })
                    print("error in JSONSerialization")
                    
                }
                
                
            }

        })

    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


class AppItemCell: UITableViewCell{
     @IBOutlet var appImage : UIImageView!
     @IBOutlet var appTitle : UILabel!
}

