//
//  BookDetailsVC.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 03/04/2021.
//

import UIKit

class BookDetailsVC: UIViewController, UINavigationControllerDelegate {

    // MARK: - Outlets

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var book : BookDetail? {
        didSet{
            updateUI()
        }
    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    
   
    // MARK: - Functions

    private func updateUI(){
        loadViewIfNeeded()
        if let details = book {
            if String(describing: details.bookTitle).contains(":") {
                let titleArray = String(describing: details.bookTitle).components(separatedBy: ":")
                labelSubtitle.text = titleArray[1]
            }
            labelTitle.text = details.bookTitle
            labelPrice.text = "\(String(describing: details.bookPrice)) \(String(describing: details.bookPriceCurrency))"
            labelAuthor.text = details.bookAuthor
            labelDescription.text = details.bookDescription
        }
    }

    
    func viewSetup () {
        labelTitle.text = ""
        labelAuthor.text = ""
        labelPrice.text = ""
        labelSubtitle.text = ""
        labelDescription.text = ""
        labelTitle.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorSemiBold, size: 30)
        labelTitle.textColor = AppColors.TextColors.Black
        labelAuthor.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorMedium, size: 20)
        labelAuthor.textColor = AppColors.TextColors.DarkestGray
        labelSubtitle.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorLight, size: 18)
        labelSubtitle.textColor = AppColors.TextColors.Black
        labelPrice.textColor = AppColors.TextColors.green
        labelPrice.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorSemiBold, size: 20)
        labelDescription.textColor = AppColors.TextColors.Black
        labelDescription.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorLight, size: 18)
        
    }
}



extension BookDetailsVC : BookSelectionDelegate{
    func bookSelected(_ newBook: BookDetail){
        book = newBook
    }
}
