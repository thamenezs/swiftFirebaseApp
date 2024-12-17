//
//  SwiftUIFirebaseBootcampApp.swift
//  SwiftUIFirebaseBootcamp
//
//  Created by Thais Souza on 17/12/24.
//

import SwiftUI
import Firebase

@main
struct SwiftUIFirebaseBootcampApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
