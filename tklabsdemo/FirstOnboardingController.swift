//
//  FirstOnboardingController.swift
//  tklabsdemo
//
//  Created by Slobodan Kovrlija on 5/17/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit
import TKOnboarding

class FirstOnboardingController: UIViewController {

    @IBOutlet weak var horizontalScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollsContentViewWidth: NSLayoutConstraint!
    
    var pages: [OnboardingView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalScrollView.delegate = self
        
        pages = createPages()
        setupPagesInScrollView()

        pageControl.numberOfPages = pages.count
    }
    
    func setupPagesInScrollView() {
        
        scrollsContentViewWidth.constant = CGFloat(pages.count) * view.frame.width
        
        for page in pages {
            contentView.addSubview(page)
        }
    }
    
    func createPages() -> [OnboardingView] {
        
        let pageOne = OnboardingView.init(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: horizontalScrollView.frame.height))
        pageOne.setTopLabel(text: "Create an account")
        pageOne.setMainLabel(text: "Connect with people around the world")
        pageOne.setPageLabel(text: "Users will be able to go live, chat and meet with people near by.")
        pageOne.setPageImage(UIImage(named: "illustration1")!)
        
        let pageTwo = OnboardingView.init(frame: CGRect(x: view.frame.width, y: 50, width: view.frame.width, height: horizontalScrollView.frame.height))
        pageTwo.setTopLabel(text: "Log in to your account")
        pageTwo.setMainLabel(text: "Let's build connection with new peoples")
        pageTwo.setPageLabel(text: "Connect helps you locate the people around you who are closest from your home town!")
        pageTwo.setPageImage(UIImage(named: "illustration2")!)

        let pageThree = OnboardingView.init(frame: CGRect(x: 2*view.frame.width, y: 50, width: view.frame.width, height: horizontalScrollView.frame.height))
        pageThree.setTopLabel(text: "Log in to your account")
        pageThree.setMainLabel(text: "Feel the happiness")
        pageThree.setPageLabel(text: "Users will be able to go live, chat and meet with people near by.")
        pageThree.setPageImage(UIImage(named: "illustration3")!)
        
        return [pageOne, pageTwo, pageThree]
    }

}

extension FirstOnboardingController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}
