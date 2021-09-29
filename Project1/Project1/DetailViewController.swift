//
//  DetailViewController.swift
//  Project1
//
//  Created by Doğancan Mavideniz on 29.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    var selectedImage: String?
    var selectedPictureNumber : Int?
    var totalPictures : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Picture \(selectedPictureNumber!) of \(totalPictures!)"
        navigationItem.largeTitleDisplayMode = .never
        

        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
     
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
