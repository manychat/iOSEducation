//
//  UserDefaultService.swift
//  ManyChatTemplates
//
//  Created by Aleksandr Lavrinenko on 24.02.2021.
//

import Foundation

@propertyWrapper struct UserDefault<T> {
	let key: String

	var wrappedValue: T? {
		get {
			UserDefaults.standard.value(forKey: key) as? T
		}
		set {
			UserDefaults.standard.setValue(newValue, forKey: key)
		}
	}
}

enum UserDefaultService {
	@UserDefault<Bool>(key: "hasSignIn") static var hasSignIn: Bool?
}
