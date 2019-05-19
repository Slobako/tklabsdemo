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
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    var pages: [OnboardingView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        horizontalScrollView.delegate = self
        
        getStartedButton.isHidden = true
        getStartedButton.layer.masksToBounds = true
        getStartedButton.layer.cornerRadius = 25
        
        pages = createPages()
        setupPagesInScrollView()

        pageControl.numberOfPages = pages.count
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        
        
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
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * horizontalScrollView.frame.size.width
        horizontalScrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        
        // Change buttons if user reaches last page by tapping page control
        if pageControl.currentPage == 2 {
            hideUnhideButtons()
        }
    }
    
    //MARK: - IBActions
    @IBAction func skipTapped(_ sender: Any) {
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        if pageControl.currentPage < 2 {
            let frame = horizontalScrollView.frame
            let offset:CGPoint = CGPoint(x: CGFloat(pageControl.currentPage + 1) * frame.size.width, y: 0)
            horizontalScrollView.setContentOffset(offset, animated: true)
            pageControl.currentPage += 1
            
            // When on last page, hide skip and next buttons and show get started button
            if pageControl.currentPage == 2 {
                hideUnhideButtons()
            }
        }
    }
    
    @IBAction func getStartedTapped(_ sender: Any) {
    }
    
    fileprivate func hideUnhideButtons() {
        UIView.transition(with: skipButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.skipButton.isHidden = true
        }, completion: nil)
        UIView.transition(with: nextButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.nextButton.isHidden = true
        }, completion: nil)
        UIView.transition(with: getStartedButton, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.getStartedButton.isHidden = false
        }, completion: nil)
    }
}

extension FirstOnboardingController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        // When user scrolls through last page, hide skip and next buttons and show get started button
        if pageControl.currentPage == 2 {
            hideUnhideButtons()
        }
    }
}
