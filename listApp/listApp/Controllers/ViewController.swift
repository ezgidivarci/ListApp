//
//  ViewController.swift
//  listApp
//
//  Created by elif nur dıvarcı on 15.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [String]()
    var alertController = UIAlertController()
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
        presentAddAlert()
    }
        
        func presentAddAlert() {
            
           /* let alertController = UIAlertController(title: "Yeni eleman ekle", message: nil, preferredStyle: .alert)
            
            
            let defaultButton = UIAlertAction(title: "ekle", style: .default) { _ in
                let text = alertController.textFields?.first?.text
                if   text != "" {
                    self.data.append((text)!)
                    self.myTableView.reloadData()
                } else {
                    self.presentWarningAlert()
                }
            }
            let cancelButton = UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil)
            
            alertController.addTextField()
            
            alertController.addAction(defaultButton)
            alertController.addAction(cancelButton)
            present(alertController, animated: true) */
            
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
        
        
        
            let cancelButton = UIAlertAction(title: "tamam", style: .cancel)
        
        if isTextFieldAvailable {
            alertController.addTextField()
        }
        
        
        
        
        alertController.addAction(cancelButton);                present(alertController, animated: true)
            
        }
        
    


}
    


