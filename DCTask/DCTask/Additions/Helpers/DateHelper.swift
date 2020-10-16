//
//  DateHelper.swift
//  DCTask
//
//  Created by Hamest Tadevosyan on 15/10/2020.
//

import UIKit

class DateHelper {
    
    struct Formats {
        static let dayMonthLongYearLong = "dd MMMM yyyy"
        static let dayMonthYear = "dd.MM.yyyy"
        static let dayMonthYearHourMinute = "dd.MM.yyyy HH:mm"
        static let dayMonthYearHourMinute1 = "dd/MM/yyyy HH:mm:ss"
        static let dayMonthYearHourMinuteAPI = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }
    
    static func changeDateFormat(dateString: String, fromFormat: String, toFormat: String) -> String {
        let date = DateHelper.convertToDate(string: dateString, fromFormat: fromFormat)
        return DateHelper.convertToString(date: date, fromFormat: toFormat)
    }
    
    static func convertToDate(string: String, fromFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        return dateFormatter.date (from: string) ?? Date()
    }
    
    static func convertToString(date: Date, fromFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        return dateFormatter.string(from: date)
    }
}
