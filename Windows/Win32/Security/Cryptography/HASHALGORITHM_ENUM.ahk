#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies signing and hashing algorithms.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ne-bcrypt-hashalgorithm_enum
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct HASHALGORITHM_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 1 (SHA1) to hash the message contents before signing.
     * @type {Integer (Int32)}
     */
    static DSA_HASH_ALGORITHM_SHA1 => 0

    /**
     * Represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 256 (SHA256) to hash the message contents before signing.
     * @type {Integer (Int32)}
     */
    static DSA_HASH_ALGORITHM_SHA256 => 1

    /**
     * Represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 512 (SHA512) to hash the message contents before signing.
     * @type {Integer (Int32)}
     */
    static DSA_HASH_ALGORITHM_SHA512 => 2
}
