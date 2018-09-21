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
 - Only take alphanumeric input. (characters A-Z, a-z and numbers 0-9)
 - The output should only include characters A-Z or 0-9. Lower-case characters should be converted to upper-case before they are encrypted.
 - The mapping should be cyclical in either direction.
 **/
struct AlphanumericCeasarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        let newplaintext = plaintext.uppercased()
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            if (unicode < 48 || unicode > 122 || (unicode > 57 && unicode < 65) || (unicode > 90 && unicode < 97)) {
                return "Error: Input Contains Invalid Characters"
            }
            
            var shiftedUnicode = unicode + shiftBy
            
            if shiftBy > 0 && shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }else if shiftBy > 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }else if shiftBy < 0 && shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }else if shiftBy < 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decrypted = ""
        
        let newplaintext = plaintext.uppercased()
        
        for character in newplaintext {
            
            let unicode = character.unicodeScalars.first!.value
            
            var shiftedUnicode = unicode - shiftBy
            
            if shiftBy > 0 && shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }else if shiftBy > 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }else if shiftBy < 0 && shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }else if shiftBy < 0 && shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            
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
