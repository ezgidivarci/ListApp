//
//  ViewController.swift
//  listApp
//
//  Created by elif nur dıvarcı on 15.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [String]()
    var alertController = UIAlertController()
    @IBOutlet weak var myTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    
    @IBAction func didRemoveBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presentAlert(title: "Uyarı", message: "Tüm öğeleri silmek istediğinizden emin misiniz?",cancelButtonTitle: "Vazgeç", defaultButtonTitle: "Evet") { _ in
            
            self.data.removeAll()
            self.myTableView.reloadData()
        }
        
    }
    
    @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presentAddAlert()
    }
    
    func presentAddAlert() {
        
        presentAlert(title: "yeni eleman ekle", message: nil,
                     cancelButtonTitle: "vazgeç",
                     isTextFieldAvailable: true,
                     defaultButtonTitle: "ekle",
                     defaultButtonHandler: { _ in
            let text = self.alertController.textFields?.first?.text
            if text != "" {
                self.data.append((text)!)
                self.myTableView.reloadData()
            } else {
                self.presentWarningAlert()
            }
            
        }
                     
        )
        
    }
        func presentWarningAlert() {
           
            presentAlert(title: "uyarı", message: "liste elemanı boş olamaz", cancelButtonTitle: "tamam")
            
        }
        
    func presentAlert(title: String?, message: String?, preferredStyle: UIAlertController.Style = .alert, cancelButtonTitle:  String?,
                      isTextFieldAvailable : Bool = false,
                      defaultButtonTitle: String? = nil,
                      defaultButtonHandler:  ((UIAlertAction) -> Void)? = nil ) {
        alertController = UIAlertController(title:title , message: message, preferredStyle: preferredStyle)
        
        if defaultButtonTitle != nil {
            let defaultButton = UIAlertAction(title: defaultButtonTitle, style: .default, handler: defaultButtonHandler)
            
            alertController.addAction(defaultButton)
        }
        
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel)
        
        if isTextFieldAvailable {
            alertController.addTextField()
        }
        
        
        alertController.addAction(cancelButton);
        present(alertController, animated: true)
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
         return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Sil") { _, _, _ in
            self.data.remove(at: indexPath.row)
            tableView.reloadData()
        }
        deleteAction.backgroundColor = .systemRed
       
        
        let editAction = UIContextualAction(style: .normal, title: "Düzenle") { _, _, _ in
            self.presentAlert(title: "Elemanı düzenle", message: nil,
                         cancelButtonTitle: "vazgeç",
                         isTextFieldAvailable: true,
                         defaultButtonTitle: "Düzenle",
                              defaultButtonHandler: { [self] _ in
                let text = self.alertController.textFields?.first?.text
                if text != "" {
                    data[indexPath.row] = text!
                    self.myTableView.reloadData()
                } else {
                    self.presentWarningAlert()
                }
                
            }
                         
            )
        }
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        
        return config
    }
}



