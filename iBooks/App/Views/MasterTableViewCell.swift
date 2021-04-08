//
//  MasterTableViewCell.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 04/04/2021.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    @IBOutlet weak var view_Shadow: UIView!
    @IBOutlet weak var label_Title: UILabel!
    @IBOutlet weak var label_Author: UILabel!
    @IBOutlet weak var label_Price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // MARK: - Functions

    func viewSetup(){
        view_Shadow.dropShadow(color: AppColors.TextColors.LightGray, opacity: 1, offset: CGSize(width: -1, height: 1), radius: 4, scale: true)
        label_Title.textColor = AppColors.TextColors.Black
        label_Title.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorSemiBold, size: 21)
        label_Author.textColor = AppColors.TextColors.DarkGray
        label_Author.font = UIFont(name: FontNames.KohinoorDevanagari.KohinoorMedium, size: 16)
        label_Price.textColor = AppColors.TextColors.green
        label_Price.layer.cornerRadius = 8
        label_Price.layer.borderWidth = 1
        label_Price.layer.borderColor = AppColors.TextColors.green.cgColor
    }
}
