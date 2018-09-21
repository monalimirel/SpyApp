//
//  ROT13CipherTests.swift
//  SpyAppTests
//
//  Created by Monali Chuatico on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class ROT13CipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ROT13Cipher()
    }
    
    func test_oneCharacterStringGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_emptyInput() {
        let input = ""
        let secretcode = "0"
        let errormessage = "Enter an input message to encode/decrypt"
        
        let encodeResult = cipher.encode(input, secret: secretcode)
        XCTAssertEqual(encodeResult, errormessage)
        let decryptResult = cipher.decrypt(input, secret: secretcode)
        XCTAssertEqual(decryptResult, errormessage)
    }
    
    func test_emptySecret(){
        let input = "test"
        let secretcode = ""
        let errormessage = "Enter a secret code"
        
        let encodeResult = cipher.encode(input, secret: secretcode)
        XCTAssertEqual(encodeResult, errormessage)
        let decryptResult = cipher.decrypt(input, secret: secretcode)
        XCTAssertEqual(decryptResult, errormessage)
    }

}
