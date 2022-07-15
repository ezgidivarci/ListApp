//
//  ViewController.swift
//  listApp
//
//  Created by elif nur dıvarcı on 15.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }


}

