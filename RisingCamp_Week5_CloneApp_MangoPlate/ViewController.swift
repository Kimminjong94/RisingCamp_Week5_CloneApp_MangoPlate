//
//  ViewController.swift
//  RisingCamp_Week5_CloneApp_MangoPlate
//
//  Created by 김민종 on 2021/12/20.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var images: [String] = ["배너1", "배너2", "배너3", "배너4", "배너5", "배너6"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .label
        configureItem()
        
        pageControl.numberOfPages = images.count
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.contentMode = .scaleAspectFit
            imgView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    private func configureItem() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "map"),
                style: .done,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "magnifyingglass"),
                style: .done,
                target: self,
                action: nil
                )
        ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "부산∨", style: .done, target: self, action: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }


}

