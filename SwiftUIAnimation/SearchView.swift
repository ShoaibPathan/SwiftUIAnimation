//
//  SearchView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/18/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI
import UIKit

class TwitterSearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let cellId = "cellId"
    let menuBar = MenuBar()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupMenuBar()
        setupCollectionView()
    }
    
    //MARK: - Private Functions
    private func setupNavBar() {
         let appearance = UINavigationBarAppearance()
         let navBar = navigationController?.navigationBar
         appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         appearance.backgroundColor = .red
         appearance.shadowColor = .red
         navBar?.isTranslucent = false
         navBar?.standardAppearance = appearance
         navigationController?.hidesBarsOnSwipe = true
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width - 140, height: 44)
        let titleView = UIView(frame: frame)
        
        let searchBar = UISearchBar()
        searchBar.frame = frame
        searchBar.placeholder = "Search Twitter"
        searchBar.tintColor = .white
        searchBar.barTintColor = .white
        searchBar.layer.cornerRadius = 20
        searchBar.clipsToBounds = true
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor(named: "Color5")
        }
        
        titleView.addSubview(searchBar)
        self.navigationItem.titleView = titleView
     }
     
     private func setupMenuBar() {
        
        menuBar.searchController = self
    
         let redView = UIView()
         redView.backgroundColor = .red
         
         view.addSubview(redView)
         view.addSubview(menuBar)
         
         redView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil
             , right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
         menuBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil
             , right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
         
     }
    
     private func setupCollectionView() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
         collectionView.backgroundColor = .white
         collectionView.delegate = self
         collectionView.dataSource = self
         
         collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
         collectionView.showsVerticalScrollIndicator = false
         collectionView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
         
     }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 5
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //MARK: - CollectionView Delegates
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let colors: [UIColor] = [.red, .blue, .green, .yellow, .purple]
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

struct SearchView: View {
    var body: some View {
        HStack {
            
            SearchMenuTab(text: "For You")
            SearchMenuTab(text: "Trending")
            SearchMenuTab(text: "News")
            SearchMenuTab(text: "Sport")
            SearchMenuTab(text: "Fun")
        }
        
        .frame(height: 60)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchMenuTab: View {
    var text: String
    
    var body: some View {
        VStack {
            Button(action: {
                print("1")
            }, label: {
                Text(text)
                    .tag(1)
            })
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color.blue)
        }
    }
}