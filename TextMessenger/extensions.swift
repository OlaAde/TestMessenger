
//
//  extensions.swift
//  TextMessenger
//
//  Created by Ademi on 04/01/2019.
//  Copyright © 2019 Dokitari. All rights reserved.
//

import Foundation

extension Date {
    static func dateFromCustomString (customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
