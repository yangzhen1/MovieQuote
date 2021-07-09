//
//  ViewController.swift
//  MovieQuote
//
//  Created by Sisyphus on 7/9/21.
//

import UIKit

class MovieQuotesTableViewController: UITableViewController {
    let movieQuoteCellIdentifier = "MovieQuoteCell"
    let detailSegueIdentifier = "DetailSegue"
    var movieQuotes = [MovieQuote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddQuoteDialog))
    
        movieQuotes.append(MovieQuote(quote: "wo shi sha bi", movie: "shabi"))
        movieQuotes.append(MovieQuote(quote: "fula", movie: "er bi"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @objc func showAddQuoteDialog(){
        let alertController = UIAlertController(title: "Create a new movie quote", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in textField.placeholder = "Quote"}
        alertController.addTextField { (textField) in textField.placeholder = "Movie"}

        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
       
        alertController.addAction(UIAlertAction(title: "Create Quote", style: UIAlertAction.Style.default) {(action) in
            let quoteTextField = alertController.textFields![0] as UITextField
            let movietextField = alertController.textFields![1] as UITextField
            let newMovieQuote = MovieQuote(quote: quoteTextField.text!,
                                           movie: movietextField.text!)
            
            self.movieQuotes.insert(newMovieQuote, at: 0)
            self.tableView.reloadData()
        })
        
        present(alertController, animated: true, completion: nil)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieQuotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = movieQuotes[indexPath.row].quote
        cell.detailTextLabel?.text = movieQuotes[indexPath.row].movie
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieQuotes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailSegueIdentifier {
            if let indexPath = tableView.indexPathForSelectedRow {
                (segue.destination as! MovieQuoteDetailViewController).movieQuote = movieQuotes[indexPath.row]
            }
        }
    }
}

