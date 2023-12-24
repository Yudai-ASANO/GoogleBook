//
//  File.swift
//  
//
//  Created by 浅野勇大 on 2023/12/24.
//

import Foundation

public enum UIState<T> {
    case idle
    case loading
    case loaded(T)
    case error(Error)
}
