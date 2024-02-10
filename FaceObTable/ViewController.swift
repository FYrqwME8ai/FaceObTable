//
//  ViewController.swift
//  FaceObTable
//
//  Created by Eugene on 10.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let personNames: [String] = ["Pavlo", "Eugene", "Petro", "Ivan", "Sam"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "someCell")
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "someCell", for:  indexPath)
        cell.textLabel?.text = personNames[indexPath.row]

        let imageName = personNames[indexPath.row]
        let image = UIImage(named: imageName)
        let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        cell.imageView?.image = image
        return cell
    }
}
