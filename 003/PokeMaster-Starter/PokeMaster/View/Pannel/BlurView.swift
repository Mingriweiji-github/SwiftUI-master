//
//  BlurView.swift
//  PokeMaster
//
//  Created by longhuadmin on 2020/7/15.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI
import UIKit

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    init(style: UIBlurEffect.Style) {
        self.style = style
    }
    // 1、makeUIView
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        print("makeUIView")
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    // 2、updateUIView
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        print("updateUIView")
        
    }
    
}

