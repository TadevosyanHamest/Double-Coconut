//
//  HomeWorker.swift
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
import RxSwift


class HomeWorker
{
    func fetchDate() -> Observable<[Card]> {
        return Observable<[Card]>.create { obs in
            var request = URLRequest(url:URL(string:Constants.URLS.cardAPIUrl)!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let tsk = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                guard error == nil else {
                    print("HTTP error: \(error!)")
                    obs.onError(error!)
                    return
                }
                
                guard data != nil else {
                    print("Protocol error: no data received")
                    let errorTemp = NSError(domain:"", code:1, userInfo:nil)
                    obs.onError(errorTemp)
                    return
                }
                do {
                    let res = try JSONDecoder().decode(Info.self, from: data!)
                    print("Succecc: \(res.data)")
                    let cards = res.data.map( { $0.attributes } )
                    obs.onNext(cards)
                    obs.onCompleted()
                } catch let err {
                    print("Format error: \(err)")
                    obs.onError(err)
                }
            })
            tsk.resume()
            return Disposables.create{ tsk.cancel() }
        }
    }
}