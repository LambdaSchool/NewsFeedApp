//
//  DetailViewController.swift
//  NewsFeed
//
//  Created by Jerrick Warren on 10/28/18.
//  Copyright © 2018 Jerrick Warren. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // include outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var articleTextView: UITextView!
    
    var record: NewsEntry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let record = record else {return}
        headlineLabel.text = record.title
        authorLabel.text = record.author
        articleTextView.text = record.content
        imageLoader()
    }
    
    
    func imageLoader () {
        ImageLoader.fetchImage(from: record?.urlToImage) { image in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.newsImage.image = image
            }
        }
        
    }
}
