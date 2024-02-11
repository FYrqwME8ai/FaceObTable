//
//  MessageViewController.swift
//  FaceObTable
//
//  Created by Eugene on 11.02.2024.
//

import UIKit

class MessageViewController: UIViewController {
    
    @IBOutlet weak var personNameLabelView: UILabel!
    
    @IBOutlet weak var personDescryptLabelView: UILabel!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    var personName: String = ""
    var personDescrypt: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personNameLabelView.text = personName
        personDescryptLabelView.text = personDescrypt
        personImageView.image = UIImage(named: personName)
        
        self.view.backgroundColor = .orange
    }
}
