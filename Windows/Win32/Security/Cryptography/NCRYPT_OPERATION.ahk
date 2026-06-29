#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_OPERATION {
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
    static NCRYPT_CIPHER_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_HASH_OPERATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SECRET_AGREEMENT_OPERATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SIGNATURE_OPERATION => 16
}
