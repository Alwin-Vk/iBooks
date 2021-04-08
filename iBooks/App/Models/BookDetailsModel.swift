//
//  BookDetailsModel.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 03/04/2021.
//

import UIKit

class BookDetail {
    let bookId: Int
    let bookTitle: String
    let bookIsbn: String
    let bookPrice: Int
    let bookPriceCurrency: String
    let bookAuthor: String
    var bookDescription: String

    init(id: Int, title: String, isbn: String, price: Int, currencyCode: String, author: String, description: String) {
        self.bookId = id
        self.bookTitle = title
        self.bookIsbn = isbn
        self.bookPrice = price
        self.bookPriceCurrency = currencyCode
        self.bookAuthor = author
        self.bookDescription = description
    }
}
