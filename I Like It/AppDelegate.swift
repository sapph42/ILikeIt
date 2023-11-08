//
//  AppDelegate.swift
//  I Like It
//
//  Created by Nick Gibson on 11/7/23.
//

import Foundation
import UIKit

func applicationWillTerminate(_ application: UIApplication) {
    save("data.json", item: items)
}

func applicationDidEnterBackground(_ application: UIApplication) {
    save("data.json", item: items)
}
