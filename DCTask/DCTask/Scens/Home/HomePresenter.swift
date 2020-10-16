//
//  HomePresenter.swift
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

protocol HomePresentationLogic
{
    func presentFetchData(response: Home.FetchData.Response)
    func presentError(error: Error)
    func showLoading()
    func hideLoading()
}

class HomePresenter: HomePresentationLogic
{
    weak var viewController: HomeDisplayLogic?
    
    // MARK: Do FetchData
    
    func presentFetchData(response: Home.FetchData.Response)
    {
        let fetchData = response.cards.map({ (card) -> Home.FetchData.ViewModel.DisplayedElement in
            let name =  card.name ?? ""
            let desc = card.description ?? ""
            let released_at = card.released_at ?? ""
            let relaseDate = DateHelper.changeDateFormat(dateString: released_at, fromFormat: DateHelper.Formats.dayMonthYearHourMinuteAPI, toFormat: DateHelper.Formats.dayMonthYearHourMinute1)
            let date = DateHelper.convertToDate(string: released_at, fromFormat: DateHelper.Formats.dayMonthYearHourMinuteAPI)
            
            return Home.FetchData.ViewModel.DisplayedElement(title: name, thumbnail: card.card_artwork_url, description: desc, releaseDate: relaseDate, date: date)
        })
        
        let viewModel = Home.FetchData.ViewModel(fetchData: fetchData)
        viewController?.displayFetchData(viewModel: viewModel)
    }
    
    func showLoading() {
        viewController?.showLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
    func presentError(error: Error) {
       viewController?.displayError(error: error)
    }
    
}