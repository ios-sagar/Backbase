//
//  Router.swift
//  BackbaseDemo
//
//  Created by Sagar Chavan on 23/02/22.
//

import Foundation
import UIKit

class Router: NSObject {

  static func getControllerWith(identifier: String) -> UIViewController {
      let storyBoard = UIStoryboard.init(name: Constants.storyboard, bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: identifier)
    return controller
  }
}
