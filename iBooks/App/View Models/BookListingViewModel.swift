//
//  ListingViewModel.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 05/04/2021.
//

import Foundation

protocol BookListingDelegate: AnyObject {
    func apiSuccess()
    func apiFailure(_ errorMessage: String)
    func updateBookDetailSuccess()
    func updateBookDetailFailed(_ errorMessage: String)
}

class BookListingViewModel {
    // MARK: - Variables
    weak var delegate: BookListingDelegate?
    var bookDetails = [BookDetail]()
    
    // MARK: - Functions

    func getBookList() {
        if let listingUrl = URL(string:APPURL.List) {
            ApiRequest.requestGET(listingUrl, success: {(response) in
                self.bookDetails.removeAll()
                if let result = response as? [[String: AnyObject]] {
                    self.bookDetails.removeAll()
                    for book in result {
                        let bookData = self.parseBookDetails(book)
                        self.bookDetails.append(bookData)
                    }
                }
                self.delegate?.apiSuccess()
            }) { (error) in
                self.delegate?.apiFailure(error.localizedDescription)
            }
        }
    }
    
    func parseBookDetails(_ data: [String: AnyObject]) -> BookDetail {
        let bookId = data["id"] as? Int ?? 0
        let title = data["title"] as? String ?? ""
        let isbn = data["isbn"] as? String ?? ""
        let price = data["price"] as? Int ?? 0
        let currencyCode = data["currencyCode"] as? String ?? ""
        let author = data["author"] as? String ?? ""
        let description = data["description"] as? String ?? ""
        return BookDetail(id: bookId, title: title, isbn: isbn, price: price, currencyCode: currencyCode, author: author, description: description)
    }
    
    func getBookDetails(_ bookId: String, index: Int) {
        if let listingUrl = URL(string:"\(APPURL.Detail)/\(bookId)") {
            ApiRequest.requestGET(listingUrl, success: { (response) in
                if let result = response as? [String: AnyObject] {
                    let updatedBookData = self.parseBookDetails(result)
                    self.bookDetails[index].bookDescription = updatedBookData.bookDescription

                }
                self.delegate?.updateBookDetailSuccess()
            }) { (error) in
                self.delegate?.updateBookDetailFailed(error.localizedDescription)
            }
        }
    }

}
