//
//  File.swift
//  SpokenEnglish
//
//  Created by longhuadmin on 2020/7/17.
//  Copyright © 2020 KM. All rights reserved.
//
import Foundation
import SwiftUI
struct Audio: Identifiable {
    let id = UUID()
    let fileName: String
    let detail: String
    let url: String
    let imageName: String
}
