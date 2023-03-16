//
//  AppDelegate.swift
//  DemoTest
//
//  Created by aravind-pt6209 on 15/03/23.
//

import Foundation
import AppKit
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var window: NSWindow!
    private var view: NSView!

    func applicationWillFinishLaunching(_ notification: Notification) {
        
        window  =  NSWindow(contentRect: NSRect(x: 0, y: 0, width: 0, height: 0),
                            styleMask: [.titled, .closable, .miniaturizable, .resizable],
                            backing: .buffered,
                            defer: false)
        window.contentViewController = LoginViewController()
        window?.title = "Login"
        
        window?.makeKeyAndOrderFront(nil)
        window.backgroundColor = .brown
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
        // Insert code here to tear down your application
        
    }

    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return false
    }


}

class TableWindow: NSWindow {
    var tableView: NSTableView!
    
    init() {
        super.init(contentRect: NSRect(x: 0, y: 0, width: 500, height: 300),
                   styleMask: [.titled, .closable, .miniaturizable, .resizable],
                   backing: .buffered,
                   defer: false)
        center()
        title = "Table View"
        
        let scrollView = NSScrollView(frame: .zero)
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        scrollView.autoresizingMask = [.width, .height]
        
        self.tableView = NSTableView(frame: .zero)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.headerView = nil
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Column"))
        column.width = 300
        self.tableView.addTableColumn(column)
        
        scrollView.documentView = self.tableView
        
        self.contentView?.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    
        let constraints = [
            scrollView.leadingAnchor.constraint(equalTo: self.contentView!.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.contentView!.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.contentView!.topAnchor, constant: 30),
            scrollView.bottomAnchor.constraint(equalTo: self.contentView!.bottomAnchor, constant: 30)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension TableWindow: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = NSTextField(labelWithString: "Table cell \(row)")
        return cell
    }
}



