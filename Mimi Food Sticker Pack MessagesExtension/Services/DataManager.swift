//
//  DataManager.swift
//  Mimi Food Sticker Pack MessagesExtension
//
//  Created by Dmitry Sechkarenko on 29.09.2021.
//

class DataManager {
    
    static let shared = DataManager()
    
     func createStickers() -> [String] {
        var stickerNames = [String]()
        
        for stickerName in 1...20 {
            let convertValue = String(stickerName)
            stickerNames.append(convertValue)
        }
        return stickerNames
    }
   
    private init() {}
}
