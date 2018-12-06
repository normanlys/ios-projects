//
//  URLSessionProtocol.swift
//  DogYearsUnitTests
//
//  Created by Norman Lim on 4/12/2018.
//  Copyright © 2018 Razeware. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}
