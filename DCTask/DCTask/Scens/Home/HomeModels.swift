//
//  HomeModels.swift
//  DCTask
//
//  Created by Hamest Tadevosyan on 14/10/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

struct Card: Codable {
    var name: String?
    var description: String?
    var released_at: String?
    var card_artwork_url: String?
}

struct Element: Codable {
    var attributes:Card
}

struct Info: Codable {
    var data: [Element]
}


enum Home
{
    // MARK: Use cases
    
    enum FetchData
    {
        struct Request
        {
        }
        struct Response
        {
            var cards:[Card]
            init(cards:[Card] = []) {
                self.cards = cards
            }
        }
        struct ViewModel
        {
            struct DisplayedElement
            {
                var title: String?
                var thumbnail: String?
                var description: String?
                var releaseDate: String?
                var date: Date?
                
                init(title: String? = nil, thumbnail: String? = nil, description: String? = nil, releaseDate: String? = nil, date: Date? = nil) {
                    self.title = title
                    self.thumbnail = thumbnail
                    self.description = description
                    self.releaseDate = releaseDate
                    self.date = date
                }
            }
            
            var fetchData:[DisplayedElement]
        }
    }
}
