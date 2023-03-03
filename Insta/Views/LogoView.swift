//
//  LogoView.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//

import SnapKit
import UIKit

class LogoView: UIView {
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constats
    private enum UIConstatns {
        static let logiWidth : CGFloat = 104
        static let logiHeight : CGFloat = 30
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        return view
    }()
}

// MARK: - Private method's
private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstatns.logiWidth)
            make.height.equalTo(UIConstatns.logiHeight)
        }
    }
}
