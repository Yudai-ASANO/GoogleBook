//
//  TopViewController.swift
//  
//
//  Created by Yudai Asano on 2023/11/09.
//

import UIKit
import SwiftUI

public class TopViewController: UIHostingController<TopView> {
    
    public init(model: TopModel) {
        self.model = model
        super.init(rootView: TopView(model: model))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let model: TopModel
    
}
