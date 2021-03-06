//
//  HomeInteractor.swift
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

protocol HomeBusinessLogic
{
    func doFetchData(request: Home.FetchData.Request)
}

protocol HomeDataStore
{
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    
    let bag = DisposeBag()
    let dispossible = CompositeDisposable()
    
    // MARK: Do FetchData
    
    func doFetchData(request: Home.FetchData.Request)
    {
        presenter?.showLoading()
        worker = HomeWorker()
        worker?.fetchDate()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (cards) in
                guard let strongSelf = self else { return }
                strongSelf.presenter?.hideLoading()
                var response = Home.FetchData.Response()
                response.cards = cards
                strongSelf.presenter?.presentFetchData(response: response)

            }, onError: { [weak self] (error) in
                guard let strongSelf = self else { return }
                strongSelf.presenter?.hideLoading()
               // strongSelf.presenter?.presentErrorRequest(response: error)
            })
        .disposed(by: bag)
    }
}
