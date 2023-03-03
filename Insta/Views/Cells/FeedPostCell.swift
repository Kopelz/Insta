//
//  FeedPostCell.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//

import SnapKit
import UIKit

class FeedPostCell: UITableViewCell {
    
    // MARK: - Public
    func configure(with info: FeedPostCellInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
        postImageView.image = info.postImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        
        if let comment = info.comment {
            commitLabel.text = comment.username + " " + comment.commentText
            //configureComment(with: comment)
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constants
    private enum Constants {
        static let userImageSize: CGFloat = 30
        static let contentInset: CGFloat = 12
        static let contentTopInset: CGFloat = 6
        static let stackToUserImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        
        static let actionStackSpacing: CGFloat = 12
        static let actionStackHeight: CGFloat = 24
        static let actionStackToPostImageOffset: CGFloat = 12
        
        static let likesLabelToActionStackOffset: CGFloat = 12
        static let commitToLikesOffset: CGFloat = 12
        
        static let usernameLabelFontSize: CGFloat = 14
        static let subtitleLabelFontSize: CGFloat = 11
        static let likesLabelFontSize: CGFloat = 14
        static let commitLabelFontSize: CGFloat = 14
    }
    
    // MARK: - Private properties
    private let userImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Constants.userImageSize / 2
        image.clipsToBounds = true
        return image
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.usernameLabelFontSize, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.subtitleLabelFontSize)
        return label
    }()
    
    private let optionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        return image
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    private let commitButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.likesLabelFontSize, weight: .bold)
        return label
    }()
    
    private let commitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constants.commitLabelFontSize)
        return label
    }()
}

// MARK: - Private method's
private extension FeedPostCell {
    func initialize() {
        selectionStyle = .none
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.size.equalTo(Constants.userImageSize)
            make.left.equalToSuperview().inset(Constants.contentInset)
            make.top.equalToSuperview().inset(Constants.contentTopInset)
        }
        
        let usernameStack = UIStackView()
        usernameStack.axis = .vertical
        usernameStack.addArrangedSubview(usernameLabel)
        usernameStack.addArrangedSubview(subtitleLabel)
        contentView.addSubview(usernameStack)
        usernameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.left.equalTo(userImageView.snp.right).offset(Constants.stackToUserImageOffset)
        }
        
        contentView.addSubview(optionButton)
        optionButton.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.right.top.equalToSuperview().inset(Constants.contentInset)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(Constants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.height)
        }
        
        let actionsStackView = UIStackView()
        actionsStackView.axis = .horizontal
        actionsStackView.spacing = Constants.actionStackSpacing
        actionsStackView.addArrangedSubview(likeButton)
        actionsStackView.addArrangedSubview(commitButton)
        actionsStackView.addArrangedSubview(shareButton)
        contentView.addSubview(actionsStackView)
        actionsStackView.snp.makeConstraints { make in
            make.height.equalTo(Constants.actionStackHeight)
            make.left.equalToSuperview().inset(Constants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(Constants.actionStackToPostImageOffset)
        }
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(Constants.contentInset)
            make.top.equalTo(actionsStackView.snp.bottom).offset(Constants.likesLabelToActionStackOffset)
        }
        
        contentView.addSubview(commitLabel)
        commitLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.contentInset)
            make.top.equalTo(likesLabel.snp.bottom).offset(Constants.commitToLikesOffset)
            make.bottom.equalToSuperview().inset(Constants.contentInset)
        }
    }
    
//    func configureComment(with comment: CommentShortInfo) {
//        let string = comment.username + " " + comment.commentText
//        let atributtedString = NSMutableAttributedString(string: string)
//        let range = NSRange(location: .zero, length: comment.username.count)
//        atributtedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: Constants.commitLabelFontSize), range: range)
//        commitLabel.attributedText = atributtedString
//    }
}
