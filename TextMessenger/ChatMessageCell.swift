//
//  ChatMessageCell.swift
//  TextMessenger
//
//  Created by Ademi on 04/01/2019.
//  Copyright © 2019 Dokitari. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageCell = UILabel()
    let bubbleBackgroundView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    
    var chatMessage : ChatMessage! {
        didSet {
            messageCell.text = chatMessage.text
            
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? UIColor.white: UIColor.darkGray
            messageCell.textColor = chatMessage.isIncoming ? UIColor.black : UIColor.white
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }else{
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        
        addSubview(bubbleBackgroundView)
        addSubview(messageCell)
        
        //        bubbleBackgroundView.backgroundColor = UIColor.yellow
        bubbleBackgroundView.layer.cornerRadius = 8
        
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        messageCell.translatesAutoresizingMaskIntoConstraints = false
        
        messageCell.text = "I love chatting, but you see a chat boy is not that good for the society so I learn to not chat so much and calm down."
        messageCell.numberOfLines = 0
        
        let constraints = [messageCell.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                           messageCell.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                           messageCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                           
                           bubbleBackgroundView.topAnchor.constraint(equalTo: messageCell.topAnchor, constant: -16),
                           bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageCell.leadingAnchor, constant: -16),
                           bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageCell.trailingAnchor, constant: 16),
                           bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageCell.bottomAnchor, constant: 16)]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        trailingConstraint = messageCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
