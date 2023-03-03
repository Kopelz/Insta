//
//  StoryItemCell.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//

import SnapKit
import UIKit

class StoryItemCell: UICollectionViewCell {
    // MARK: - Public
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLable.text = info.username
        addButton.isHidden = !info.isAddButtonVisible
        circleImageView.isHidden = !info.isNewStory
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum Constants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        
        static let usernameFont: CGFloat = 12
        static let buttonAddSize: CGFloat = 20
        static let circleImageSize: CGFloat = 72
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Constants.imageSize / 2
        image.clipsToBounds = true
        return image
    }()
    
    private let usernameLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.usernameFont)
        label.textAlignment = .center
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "button"), for: .normal)
        return button
    }()
    
    private let circleImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "storyRing")
        return image
    }()
}
// MARK: - Private method's
private extension StoryItemCell {
    func initialize() {
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(Constants.imageSize)
            make.top.left.right.equalToSuperview().inset(Constants.imageToCellInset)
        }
        contentView.addSubview(usernameLable)
        usernameLable.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(Constants.imageToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(Constants.imageToLabelOffset)
        }
        
        contentView.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.size.equalTo(Constants.buttonAddSize)
            make.right.bottom.equalTo(imageView)
        }
        
        contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(Constants.circleImageSize)
        }
    }
}
