//
//  TopViewController.swift
//  
//
//  Created by Yudai Asano on 2023/11/09.
//

import UIKit
import APIClient

public class TopViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let response = try await GetSearchResult(keyword: "abc").sendRequest()
                await MainActor.run {
                    response.items?.forEach({ item in
                        print(item)
                    })
                }
            } catch {
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
