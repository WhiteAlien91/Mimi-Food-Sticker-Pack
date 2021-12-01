//
//  MiMiFoodStickerBrowserViewController.swift
//  Mimi Food Sticker Pack MessagesExtension
//
//  Created by Dmitry Sechkarenko on 14.05.2021.
//

import UIKit
import Messages

class MiMiFoodStickerBrowserViewController: MSStickerBrowserViewController {
    
    let sticker = Sticker.getStickers()
    
    var stickers = [MSSticker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOSApplicationExtension 13.0, *) {
            stickerBrowserView.backgroundColor = .dynamicColor
        } else {
            stickerBrowserView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.8705882353, blue: 0.8470588235, alpha: 1)
        }
        loadStickers()
    }
    
    func loadStickers() {
        stickers = sticker.stickerNames.compactMap { name in
            guard let url = Bundle.main.url(forResource: name, withExtension: "png") else { return nil }
            return try? MSSticker(contentsOfFileURL: url, localizedDescription: name)
        }
    }
}

extension MiMiFoodStickerBrowserViewController {
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}

extension UIColor {
    @available(iOSApplicationExtension 13.0, *)
    static let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if traitCollection.userInterfaceStyle == .light {
            return #colorLiteral(red: 0.9411764706, green: 0.8705882353, blue: 0.8470588235, alpha: 1)
        } else {
            return .systemBackground
        }
    }
}
