//
//  FeedViewController.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//
import SnapKit
import UIKit

class FeedViewControlller: UIViewController {
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        initialize()
    }
    
    // MARK: - Private properties
    private let tableView = UITableView()
    private let items: [FeedItemType] = [
        .stories([
            .init(image: UIImage(named: "storyPhoto")!, username: "Gav", isAddButtonVisible: true, isNewStory: false),
            .init(image: UIImage(named: "storyPhoto")!, username: "user1", isAddButtonVisible: false, isNewStory: true),
            .init(image: UIImage(named: "storyPhoto")!, username: "UFF", isAddButtonVisible: false, isNewStory: true),
            .init(image: UIImage(named: "storyPhoto")!, username: "opp", isAddButtonVisible: false, isNewStory: false),
            .init(image: UIImage(named: "storyPhoto")!, username: "iosre", isAddButtonVisible: false, isNewStory: false),
            .init(image: UIImage(named: "storyPhoto")!, username: "fw", isAddButtonVisible: false, isNewStory: true)
                 ]),
        .post(.init(userImage: UIImage(named: "storyPhoto")!, username: "oop", postSubtitle: "Sponsored", postImage: UIImage(named: "photo")!, numberOfLikes: 515, comment: .init(username: "iosre", commentText: "fafaagkjhagskjhaskjhgjgsajsgajghjasgl"))),
        .post(.init(userImage: UIImage(named: "storyPhoto")!, username: "oop", postSubtitle: "Sponsored", postImage: UIImage(named: "photo")!, numberOfLikes: 515, comment: .init(username: "iosre", commentText: "fafaagkjhagskjhaskjhgjgsajsgajghjasgl"))),
        .post(.init(userImage: UIImage(named: "storyPhoto")!, username: "oop", postSubtitle: "Sponsored", postImage: UIImage(named: "photo")!, numberOfLikes: 515, comment: .init(username: "iosre", commentText: "fafaagkjhagskjhaskjhgjgsajsgajghjasgl"))),
        .post(.init(userImage: UIImage(named: "storyPhoto")!, username: "oop", postSubtitle: "Sponsored", postImage: UIImage(named: "photo")!, numberOfLikes: 515, comment: .init(username: "iosre", commentText: "fafaagkjhagskjhaskjhgjgsajsgajghjasgl")))
        ]
}

// MARK: - Private method's
private extension FeedViewControlller {
    func initialize() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItem()
        navigationItem.rightBarButtonItems = makeRightBarButtonItem()
        
        // set tableView
        setTableView()
    }
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarButtonItem() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropBarButtonItem]
    }
    
    func makeRightBarButtonItem() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc func didTapPlusButton() {
        print("Add")
    }
    
    @objc func didTapDirectButton() {
        print("Direct")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favs")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

//MARK: - UITableViewDataSource
extension FeedViewControlller: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension FeedViewControlller: UITableViewDelegate {
    
}
