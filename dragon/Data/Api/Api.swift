//
//  Api.swift
//  testView
//
//  Created by GGsrvg on 19.01.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift


class Api {
    private static let server = "https://www.mocky.io/v2/"
    
    static func items() -> Single<ApiResponse> {
        return Single<ApiResponse>.create { single in
            let task = URLSession.shared.dataTask(with: URL(string: "\(server)5e2431eb340000d501012bc3")!) { data, _, error in
                if let error = error {
                    single(.error(error))
                    return
                }

                guard let data = data else {
                    print("data == nil")
                    return
                }

                let jsonDecoder = JSONDecoder()
                
                do {
                    let response = try jsonDecoder.decode(ApiResponse.self, from: data)
                    single(.success(response))
                } catch {
                     print("Could not get API data. \(error), \(error.localizedDescription)")
                }
            }

            task.resume()

            return Disposables.create { task.cancel() }
        }
    }
}
