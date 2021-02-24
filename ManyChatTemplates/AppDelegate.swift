//
//  AppDelegate.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 21.01.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow()

		let viewController = UserDefaultService.hasSignIn == true ? TempalteViewController() : ViewController()
		let navigationController = UINavigationController(rootViewController: viewController)
		window?.rootViewController = navigationController

		window?.makeKeyAndVisible()

		print(persistentContainer)
		return true
	}

	lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "Model")
		container.loadPersistentStores { description, error in
			if let error = error {
				fatalError("Unable to load persistent stores: \(error)")
			}
		}
		return container
	}()
}

