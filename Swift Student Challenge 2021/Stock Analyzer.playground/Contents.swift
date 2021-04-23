/*:
 WWDC 2021 Swift Student Challange Submission - Tan Wei Liang
 
 Good Day,
 My name is Tan Wei Liang and this is my submission for the 2021 Swift Student Challenge.
 
 In the past few months, friends around me started to investing and later most of them did not make profit from the stock mainly because they did not research the company before investing in it. Some of them loses a lot money and I think I can do something to educate or make their learning experience more easy.
 
 Hence, I have created a Playground to educate the people about some indicators that can shows the performace of the company in terms of growth, this will help the people to make wise choices before they started to invest in a company.
 
 I hope you enjoy viewing my Playground and maybe learn something from it :)
 
 Thank you,
 Wei Liang
 */

import UIKit
import PlaygroundSupport

//Create view with navigation controller
let viewRect = CGRect(x: 0, y: 0, width: 900, height: 600)
let viewController = Introduction()
let navigationController = UINavigationController(rootViewController: viewController)
navigationController.navigationBar.isHidden = true
navigationController.view.frame = viewRect
PlaygroundPage.current.liveView = navigationController

