//
//  ViewController.swift
//  FaceObTable
//
//  Created by Eugene on 10.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var persons: [Person] = [
        Person(name: "Pavlo", descrypt: "Programer"),
        Person(name: "Eugene", descrypt: "Student"),
        Person(name: "Petro", descrypt: "Killer"),
        Person(name: "Ivan", descrypt: "Gamer"),
        Person(name: "Sam", descrypt: "Impostor"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "customCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.personNameLabel.text = persons[indexPath.row].name
        cell.personDescriptLabel.text = persons[indexPath.row].descrypt
        
        let imgName = persons[indexPath.row].image
        let personImage = UIImage(named: imgName)
        cell.imageView?.image = personImage
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let messageVC = MessageViewController()
        
        messageVC.personName = persons[indexPath.row].name
        messageVC.personDescrypt = persons[indexPath.row].descrypt
        
        self.navigationController?.pushViewController(messageVC, animated: true)
        
//        self.present(messageVC, animated: true)
        
//        let title = personNames[indexPath.row]
//        let message = personDescript[indexPath.row]
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let actionOne = UIAlertAction(title: "OK", style: .default)
//        let actionTwo = UIAlertAction(title: "Cancel", style: .default)
//        alert.addAction(actionOne)
//        alert.addAction(actionTwo)
//        self.present(alert, animated: true)
    }
}

struct Person {
    let name: String
    let descrypt: String
    var image: String { name }
}
