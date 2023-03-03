//
//  FeedStoriesSetCell.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//

import SnapKit
import UIKit

class FeedStoriesSetCell: UITableViewCell {
    // MARK: - Public
    func configure(with info: FeedStoriesCellInfo) {
        self.items = info
        colletionView.reloadData()
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constats
    private enum ConstantsSize {
        static let cellStoryWhight: CGFloat = 72
        static let cellStoryHeight: CGFloat = 98
        
        static let collectionViewHeigth: CGFloat = 106
    }
    
    // MARK: - Private properties
    private var colletionView: UICollectionView!
    private var items: FeedStoriesCellInfo = []
}

// MARK: - Private method's
private extension FeedStoriesSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.register(StoryItemCell.self, forCellWithReuseIdentifier: String(describing: StoryItemCell.self))
        colletionView.dataSource = self
        colletionView.delegate = self
        colletionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(colletionView)
        colletionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(ConstantsSize.collectionViewHeigth)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension FeedStoriesSetCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoryItemCell.self), for: indexPath) as! StoryItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedStoriesSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: ConstantsSize.cellStoryWhight, height: ConstantsSize.cellStoryHeight)
    }
}
