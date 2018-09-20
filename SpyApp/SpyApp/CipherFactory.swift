import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        //"Alphanumeric": AlphanumericCeaserCipher()
        "ROT-13": ROT13Cipher(),
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
