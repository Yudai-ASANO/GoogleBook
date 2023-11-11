//
//  TopViewController.swift
//  
//
//  Created by Yudai Asano on 2023/11/09.
//

import UIKit
import SwiftUI

public class TopViewController: UIHostingController<TopView> {
    
    public init() {
        super.init(rootView: TopView())
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
