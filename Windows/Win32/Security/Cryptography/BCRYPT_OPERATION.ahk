#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_OPERATION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_CIPHER_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_HASH_OPERATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_SECRET_AGREEMENT_OPERATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_SIGNATURE_OPERATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RNG_OPERATION => 32
}
