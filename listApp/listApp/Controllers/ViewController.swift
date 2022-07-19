//
//  ViewController.swift
//  listApp
//
//  Created by elif nur dıvarcı on 15.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [String]()
    @IBOutlet weak var myTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
         return cell
    }
    
    @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Yeni eleman ekle", message: nil, preferredStyle: .alert)
        
        
        let defaultButton = UIAlertAction(title: "ekle", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            if   text != "" {
                self.data.append((text)!)
                self.myTableView.reloadData()
            } else {
                let alertController = UIAlertController(title:"uyarı" , message: "liste elemanı boş olamaz", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "tamam", style: .cancel)
                alertController.addAction(cancelButton);                self.present(alertController, animated: true)
            }
        }
        let cancelButton = UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil)
        
        alertController.addTextField()
        
        alertController.addAction(defaultButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
        
        
    }


}

