//
//  Sticker.swift
//  Mimi Food Sticker Pack MessagesExtension
//
//  Created by Dmitry Sechkarenko on 29.09.2021.
//

import Foundation

struct Sticker {
    
    let stickerNames: [String]
    
    static func getStickerNames() -> Sticker {
        let stickerNames = DataManager.shared.stickerNames
        let stickers = Sticker(stickerNames: stickerNames)
        
        return stickers
    }
    
}
