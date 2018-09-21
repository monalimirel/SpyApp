import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCeasarCipher(),
        "ROT-13": ROT13Cipher(),
        "Lucky-7": Lucky7Cipher(),
        //"AtbashCipher": AtbashCipher(),
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
