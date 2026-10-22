//
//  SpotBumbleApp.swift
//  SpotBumble
//
//  Created by Md Mahamudul Islam on 10/22/26.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpotBumbleApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}



// Source - https://stackoverflow.com/a/60067869
// Posted by Nick Bellucci
// Retrieved 2026-10-30, License - CC BY-SA 4.0

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
