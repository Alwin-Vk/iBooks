//
//  MasterViewController.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 03/04/2021.
//

import UIKit
import Alamofire
import SwiftyJSON


protocol BookSelectionDelegate: class {
    func bookSelected(_ newBook : BookDetail)
}
class MasterViewController: UITableViewController {
    
    // MARK: - Variables
    weak var delegate : BookSelectionDelegate?
    var books = [BookDetail]()
    private var selectedIndex = 0
    private var bookListingViewModel = BookListingViewModel()
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        bookListingViewModel.delegate = self
        bookListingViewModel.getBookList()
        
    }
    
    func getBookDetails() {
        let theBook = books[selectedIndex]
        if theBook.bookDescription == "" {
            bookListingViewModel.getBookDetails("\(theBook.bookId)", index: selectedIndex)
        } else {
            setDetailPage()
        }
    }
    
    func setDetailPage() {
        delegate?.bookSelected(books[selectedIndex])
        if let detailViewController = delegate as? BookDetailsVC,
           let detailNavigationController = detailViewController.navigationController{
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! MasterTableViewCell
        let book = books[indexPath.row]
        cell.label_Title.text = book.bookTitle
        cell.label_Price.text = "\(book.bookPrice)"+" "+"\(book.bookPriceCurrency)"
        cell.label_Author.text = book.bookAuthor

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        getBookDetails()
    }
}

extension MasterViewController: BookListingDelegate {
    func updateBookDetailSuccess() {
        if bookListingViewModel.bookDetails.count == 0 {
        } else {
            books = bookListingViewModel.bookDetails
            self.tableView.reloadData()
            setDetailPage()
        }
    }
    
    func updateBookDetailFailed(_ errorMessage: String) {
        
    }
    
    func apiSuccess() {
        if bookListingViewModel.bookDetails.count == 0 {

        } else {
            books = bookListingViewModel.bookDetails
            delegate?.bookSelected(books[selectedIndex])
        }
        self.tableView.reloadData()
    }
    
    func apiFailure(_ errorMessage: String) {

    }
}
