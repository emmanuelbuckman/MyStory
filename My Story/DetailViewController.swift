//
//  DetailViewController.swift
//  My Story
//
//  Created by Emmanuel Buckman on 1/31/23.
//

import UIKit

class DetailViewController: UIViewController {

    var detail: Detail?
    
    let background = Detail(image: UIImage(named: "ghana")!, info: "I am a senior Biology major from Atlanta, Georgia by way of Ghana. I was born and raised in Ghana, moving to the United States while in middle school.")
    let interests = Detail(image: UIImage(named: "rashford")!, info: "I like to watch sports and shows during my spare time, especially soccer. My favorite team is Manchester United and I try to watch all their games. I also like to play video games like fifa and work out in my spare time.")
    let aspirations = Detail(image: UIImage(named: "aspirations")!, info: "I aspire to be a software engineer in the future once I graduate. I am interested in several different areas such as DevOps, mobile app development, artificial intellingence and machine learning. I want to start a tech company in the future which will provide service to people all over the world.")
    
    var details: [Detail] = []
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailInfo: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "detailSegue",
            let tappedView = sender as? UIView,
            let detailViewController = segue.destination as? DetailViewController {

            if tappedView.tag == 0 {
                detailViewController.detail = details[0]
            } else if tappedView.tag == 1 {
                detailViewController.detail = details[1]
            } else if tappedView.tag == 2 {
                detailViewController.detail = details[2]
            } else {
                print("no option was tapped, please check your selection.")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        details = [background, interests, aspirations]
        
        if let detail = detail {
            detailImageView.image = detail.image
            detailInfo.text = detail.info
        }
    }
    

    @IBAction func didTapOption(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            performSegue(withIdentifier: "detailSegue", sender: tappedView)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
