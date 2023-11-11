//
//  BookModel.swift
//  
//
//  Created by Yudai Asano on 2023/11/11.
//

import UIKit

public struct BookModel: Hashable {
    public let kind: String
    public let volumes: [VolumeModel]
    
    public init(kind: String, volumes: [VolumeModel]) {
        self.kind = kind
        self.volumes = volumes
    }
}
