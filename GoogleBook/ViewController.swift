//
//  ViewController.swift
//  GoogleBook
//
//  Created by Yudai Asano on 2023/11/08.
//

import UIKit
import APIClient

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let response = try await GetSearchResult(keyword: "abc").sendRequest()
                response.items?.forEach({ item in
                    print(item)
                })
            } catch {
                print(error)
            }
        }
    }


}

