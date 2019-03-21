//
//  TagCollectionViewCell.swift
//  TagCollectionView
//
//  Created by Prudhvi Gadiraju on 3/20/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    var cellTag: Tag! {
        didSet {
            setup()
        }
    }

    var containerView = UIView()
    var closeButton = UIButton()
    var label = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    fileprivate func setup() {
        setupCloseButton()
        setupLabel()
        setupView()
    }
    
    fileprivate func setupCloseButton() {
        closeButton.setImage(#imageLiteral(resourceName: "CloseButton"), for: .normal)
        closeButton.addTarget(self, action: #selector(handleCloseButtonTapped), for: .touchUpInside)
        
        containerView.addSubview(closeButton)
    }
    
    fileprivate func setupLabel() {
        var text = "  "
        text.append(cellTag.name)
        text.append(" ")
        
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.sizeToFit()
        
        containerView.addSubview(label)
    }
    
    fileprivate func setupView() {
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .darkGray

        addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalToSystemSpacingBelow: containerView.centerYAnchor, multiplier: 0).isActive = true
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 1).isActive = true
        closeButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -15).isActive = true
        closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor, constant: 0).isActive = true
    }
    
    func printStuff() {
        print("From the cell")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        var frame = layoutAttributes.frame
        frame.size.width = label.frame.width + closeButton.frame.width*2
        layoutAttributes.frame = frame
    
        return layoutAttributes
    }
    
    @objc func handleCloseButtonTapped() {
        print("Remove Tag")
    }
}
