//
//  SampleRepository.swift
//  WatchAppSample WatchKit Extension
//
//  Created by T T on 2019/11/11.
//  Copyright © 2019 tt. All rights reserved.
//

import Foundation

import RxAlamofire
import Alamofire
import RxSwift
import RxCocoa

enum APIError: Error {
    case invalidInput
    case badResposne
    
    func toNSError() -> NSError {
        let domain = "com.github.rxswiftcommunity.rxalamofire"
        switch self {
        case .invalidInput:
            return NSError(domain: domain, code: -1, userInfo: [NSLocalizedDescriptionKey: "Input should be a valid number"])
        case .badResposne:
            return NSError(domain: domain, code: -2, userInfo: [NSLocalizedDescriptionKey: "Bad response"])
        }
    }
}

class SampleRepository {
    
    let disposeBag = DisposeBag()
    
    static func getNews() -> [SampleModel] {
        // APIもしくは DBから取得
        return db
    }
    
    func getNews() -> Observable<String> {
        return getNewsAlamo()
    }
    
    func addNews( sample: SampleModel ){
        db.append(sample)
    }
    
    func getNewsAlamo() -> Observable<String> {
        let exchangeRateEndpoint = "https://api.exchangeratesapi.io/latest?base=EUR&symbols=USD"
        return json(.get, exchangeRateEndpoint)
            .debug()
            .flatMap { ( json) -> Observable<String> in
                guard
                    let body = json as? [String: Any],
                    let rates = body["rates"] as? [String: Any],
                    let rate = rates["USD"] as? Double
                    else {
                        return .error(APIError.badResposne.toNSError())
                }
                return .just(rate.description)
        }
    }
}

var db: [SampleModel] = []
