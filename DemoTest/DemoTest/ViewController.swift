//
//  ViewController.swift
//  DemoTest
//
//  Created by aravind-pt6209 on 16/03/23.
//

import Foundation
import AppKit
import Cocoa

import Cocoa

class LoginViewController: NSViewController {
    private var usernameField: NSTextField!
    private var passwordField: NSSecureTextField!
    private var loginButton: NSButton!
    
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 600))
        view.wantsLayer = true
        view.layer?.backgroundColor = .white
        //        view.autoresizingMask = [.width, .height]
        
        // Username field
        usernameField = NSTextField(frame: NSRect(x: 20, y: 150, width: 360, height: 22))
        usernameField.placeholderString = "Username"
        view.addSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        // Password field
        passwordField = NSSecureTextField(frame: NSRect(x: 20, y: 115, width: 360, height: 22))
        passwordField.placeholderString = "Password"
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        // Login button
        loginButton = NSButton(title: "Login", target: self, action: #selector(loginButtonClicked))
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints
        NSLayoutConstraint.activate([
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            usernameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            passwordField.bottomAnchor.constraint(lessThanOrEqualTo: loginButton.topAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            loginButton.widthAnchor.constraint(equalToConstant: 80),
            loginButton.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    @objc func loginButtonClicked() {
        // Implement login button clicked action here
    }
}
