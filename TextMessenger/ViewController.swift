//
//  ViewController.swift
//  TextMessenger
//
//  Created by Ademi on 04/01/2019.
//  Copyright © 2019 Dokitari. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    //    let chatMessages = [
    //        [
    //            ChatMessage(text: "Hello Everyone", isIncoming: true, date: Date.dateFromCustomString(customString: "22/05/2018")),
    //        ],
    //        [
    //            ChatMessage(text: "My name is Emma.G and I'm a beautiful somebody", isIncoming: true, date: Date.dateFromCustomString(customString: "24/05/2018")),
    //            ChatMessage(text: "I love chatting, but you see a chat boy is not that good for the society so I learn to not chat so much and calm down.", isIncoming: true, date: Date.dateFromCustomString(customString: "24/05/2018")),
    //            ChatMessage(text: "Guys, I know what you mean", isIncoming: false, date: Date.dateFromCustomString(customString: "24/05/2018")),
    //            ChatMessage(text: "Greetings", isIncoming: false, date: Date.dateFromCustomString(customString: "24/05/2018"))
    //        ],
    //        [
    //            ChatMessage(text: "How was your day?", isIncoming: false, date: Date.dateFromCustomString(customString: "26/05/2018")),
    //            ChatMessage(text: "Twas nice. How about you?", isIncoming: true, date: Date.dateFromCustomString(customString: "26/05/2018"))
    //        ],
    //        [
    //            ChatMessage(text: "Cool. Finally got some things done", isIncoming: false, date: Date.dateFromCustomString(customString: "30/05/2018")),
    //            ChatMessage(text: "Wonderful", isIncoming: true, date: Date.dateFromCustomString(customString: "30/05/2018"))
    //        ]
    //    ]
    //
    var arrangedChatMessages = [[ChatMessage]]()
    
    
    let messagesFromServer = [
        ChatMessage(text: "Hello Everyone", isIncoming: true, date: Date.dateFromCustomString(customString: "22/05/2018 05:20")),
        ChatMessage(text: "1My name is Emma.G and I'm a beautiful somebody", isIncoming: true, date: Date.dateFromCustomString(customString: "24/05/2018 05:20")),
        ChatMessage(text: "2I love chatting, but you see a chat boy is not that good for the society so I learn to not chat so much and calm down.", isIncoming: true, date: Date.dateFromCustomString(customString: "24/05/2018 05:24")),
        ChatMessage(text: "Cool. Finally got some things done", isIncoming: false, date: Date.dateFromCustomString(customString: "30/05/2018 05:20")),
        ChatMessage(text: "Wonderful", isIncoming: true, date: Date.dateFromCustomString(customString: "30/05/2018 05:20")),
        ChatMessage(text: "4Greetings", isIncoming: false, date: Date.dateFromCustomString(customString: "24/05/2018 07:20")),
        ChatMessage(text: "3Guys, I know what you mean", isIncoming: false, date: Date.dateFromCustomString(customString: "24/05/2018 06:20")),
        ChatMessage(text: "How was your day?", isIncoming: false, date: Date.dateFromCustomString(customString: "26/05/2018 05:20")),
        ChatMessage(text: "Twas nice. How about you?", isIncoming: true, date: Date.dateFromCustomString(customString: "26/05/2018 05:20")),
        
    ]
    
    func attemptToAssembleMessageesByGroup() {
        print("Attemp/ting Arrangement")
        
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        
        let sortedKeys = groupedMessages.keys.sorted()
        
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            arrangedChatMessages.append(values ?? [])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        attemptToAssembleMessageesByGroup()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrangedChatMessages[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrangedChatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = DateHeaderLabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        if let firstMessageInSection = arrangedChatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyy"
            label.text =  "\(dateFormatter.string(from: firstMessageInSection.date))"
        }
        
        let containerView = UIView()
        
        containerView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        return containerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        
        //        cell.messageCell.text = messages[indexPath.row].text
        cell.chatMessage = arrangedChatMessages[indexPath.section][indexPath.row]
        //        cell.isIncoming = messages[indexPath.row].isIncoming
        return cell
    }
}

