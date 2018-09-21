import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }

        var decrypted = ""

        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
    
}



/**
 The ROT-13 cipher is a substitution cipher with a specific key where the letters of the alphabet are offset 13 places.
 - I.e. all 'A's are replaced with 'N's, all 'B's are replaced with 'O's, and so on.
 - Valid Input: a-z, A-Z
 **/
struct ROT13Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + 13
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, secret: String) -> String? {
        
        var decrypted = ""
        
        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - 13
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
}

/**
 The Lucky-7 cipher is a substitution cipher with a specific key where the letters of the alphabet are offset 7 places.
 - I.e. all 'A's are replaced with 'H's, all 'B's are replaced with 'I's, and so on.
 - Valid Input: a-z, A-Z
 **/
struct Lucky7Cipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + 7
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, secret: String) -> String? {
        
        var decrypted = ""
        
        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - 7
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        
        return decrypted
    }
}




//struct AtbashCipher: Cipher {
//
//}
