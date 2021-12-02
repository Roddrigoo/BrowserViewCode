//
//  ViewController.swift
//  Browser ViewCode
//
//  Created by Rodrigo Rodrigues on 29/11/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{
    
    private var btButtonGo = UIButton()
    private var browser = WKWebView()
    private var txtUrl = UITextField()
    
    private let urlPrefix = "https://www."
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addTextFild()
        addWebView()
        addButtonGo()
    }
    
    @objc func enterSite(){
        
        let url = urlPrefix + txtUrl.text!
        let urlRequest = URLRequest(url: URL(string: url)!)
        browser.load(urlRequest)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - WKWebView
    //-----------------------------------------------------------------------
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIView.animate(withDuration: 0.3) {
            self.browser.alpha = 1
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    private func setupUI(){
        
        let vwContent = UIView()
        vwContent.frame = UIScreen.main.bounds
        self.view = vwContent
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Add Constraints
    //-----------------------------------------------------------------------
    
    func addTextFild(){
        
        txtUrl.backgroundColor = .darkGray
        txtUrl.placeholder = "https://www."
        txtUrl.textColor = .white
        txtUrl.borderStyle = .roundedRect
        txtUrl.autocapitalizationType = .none
        txtUrl.keyboardType = .webSearch
        txtUrl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txtUrl)
        
        let constraintTop = NSLayoutConstraint(item: self.txtUrl,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self.view,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 40)
        
        let constraintLeading = NSLayoutConstraint(item: self.txtUrl,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 10)
        
        let constraintTrailing = NSLayoutConstraint(item: txtUrl,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -10)
        
        let constraintHeight = NSLayoutConstraint(item: txtUrl,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintHeight, constraintTrailing, constraintTop, constraintLeading])
    }
    
    func addWebView(){
        
        browser.navigationDelegate = self
        browser.alpha = 0
        browser.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(browser)
        
        let constraintTop = NSLayoutConstraint(item: self.browser,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: txtUrl,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 50)
        
        let constraintLeading = NSLayoutConstraint(item: self.browser,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 0)
        
        let constraintTrailing = NSLayoutConstraint(item: browser,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 0)
        
        let constraintBotton = NSLayoutConstraint(item: browser,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: -100)
        
        self.view.addConstraints([constraintBotton, constraintTrailing, constraintTop, constraintLeading])
    }
    
    func addButtonGo(){
        
        btButtonGo.layer.cornerRadius = 5
        btButtonGo.backgroundColor = .systemBlue
        btButtonGo.setTitle("Go!", for: .normal)
        btButtonGo.addTarget(self, action: #selector(enterSite), for: .touchUpInside)
        btButtonGo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btButtonGo)
        
        let constraintLeading = NSLayoutConstraint(item: self.btButtonGo,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 100)
        
        let constraintTrailing = NSLayoutConstraint(item: btButtonGo,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -100)
        
        let constraintBotton = NSLayoutConstraint(item: btButtonGo,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: -50)
        
        self.view.addConstraints([constraintBotton, constraintTrailing, constraintLeading])
    }
}

