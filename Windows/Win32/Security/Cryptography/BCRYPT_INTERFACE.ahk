#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_INTERFACE {
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
    static BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_CIPHER_INTERFACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_HASH_INTERFACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_RNG_INTERFACE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_SECRET_AGREEMENT_INTERFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BCRYPT_SIGNATURE_INTERFACE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_KEY_STORAGE_INTERFACE => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SCHANNEL_INTERFACE => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SCHANNEL_SIGNATURE_INTERFACE => 65539
}
