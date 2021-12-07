//
//  BrowserModule.swift
//  aftermath
//
//

import Foundation

class BrowserModule {
    
    let caseHandler: CaseHandler
    let browserDir: URL
    let firefox: URL
    let chrome: URL
    let safari: URL
    let opera: URL
    let brave: URL
    let writeFile: URL
    
    init(caseHandler: CaseHandler) {
        self.caseHandler = caseHandler
        self.browserDir = caseHandler.createNewDir(dirName: "browsers")
        self.firefox = caseHandler.createNewDir(dirName: "browsers/firefox")
        self.chrome = caseHandler.createNewDir(dirName: "browsers/chrome")
        self.safari = caseHandler.createNewDir(dirName: "browsers/safari")
        self.opera = caseHandler.createNewDir(dirName: "browsers/opera")
        self.brave = caseHandler.createNewDir(dirName: "browsers/brave")
        
        self.writeFile = caseHandler.createNewCaseFile(dirUrl: browserDir, filename: "browsers.txt")
    }
    
    func start() {
        self.caseHandler.log("Collecting browser information...")
        
        let firefox = Firefox(caseHandler: caseHandler, browserDir: self.browserDir, firefoxDir: self.firefox, writeFile: self.writeFile)
        firefox.run()
        
        let chrome = Chrome(caseHandler: caseHandler, browserDir: self.browserDir, chromeDir: self.chrome, writeFile: self.writeFile)
        chrome.run()
        
        let safari = Safari(caseHandler: caseHandler, browserDir: self.browserDir, safariDir: self.safari, writeFile: self.writeFile)
        safari.run()
        
        let opera = Opera(caseHandler: caseHandler, browserDir: self.browserDir, operaDir: self.opera, writeFile: self.writeFile)
        opera.run()
        
        let brave = Brave(caseHandler: caseHandler, browserDir: self.browserDir, braveDir: self.brave, writeFile: self.writeFile)
        brave.run()
    }
}
