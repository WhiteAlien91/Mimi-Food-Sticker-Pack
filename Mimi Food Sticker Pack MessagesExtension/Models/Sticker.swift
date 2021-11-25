//
//  Sticker.swift
//  Mimi Food Sticker Pack MessagesExtension
//
//  Created by Dmitry Sechkarenko on 29.09.2021.
//

import Foundation

struct Sticker {
    let stickerNames: [String]
    
    static func getStickers() -> Sticker {
        let stickerNames = DataManager.shared.createStickers()
        let stickers = Sticker(stickerNames: stickerNames)
        return stickers
    }
}
