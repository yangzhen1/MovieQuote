//
//  ViewController.swift
//  MovieQuote
//
//  Created by Sisyphus on 7/9/21.
//

import UIKit

class TempViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tempCellIdentifier = "TempCell"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tempCellIdentifier, for: indexPath)
        cell.textLabel?.text = "this is row \(indexPath.row)"
        
        return cell
    }
}

