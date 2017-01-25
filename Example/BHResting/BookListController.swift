//
//  BookListController.swift
//  BHResting
//
//  Created by Brian Heller on 1/25/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class BookListController: UITableViewController {
    
    var assets:[Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        assets = [Book]()
        
        // test
        let book = Book()
        book.all { (books, error) in
            if(error != nil) {
                print(error ?? "yeah")
            }
            for book in books! {
               let b = Book(fromDictionary: book as! NSDictionary)
                self.assets?.append(b)
            }
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let book = assets![indexPath.row]
        cell.textLabel!.text = book.title!
        cell.detailTextLabel!.text = book.author!

        return cell
    }
}
