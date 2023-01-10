//
//  ElementTableViewCell.swift
//  VK Cup R2
//
//  Created by Kurbatov Artem on 05.01.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let bgView = UIView()
    private let clearBgView = UIView()
    private let titleLabel = UILabel()
    
    func configureCell(text: String) {
        
        selectionStyle = .none
        
        backgroundView = clearBgView
        
        clearBgView.backgroundColor = .clear
        
        clearBgView.addSubview(bgView)
        clearBgView.addSubview(titleLabel)
        
        bgView.backgroundColor = .systemBlue
        bgView.alpha = 0.5
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        
        titleLabel.text = text
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            titleLabel.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor)
        ])
    }
}