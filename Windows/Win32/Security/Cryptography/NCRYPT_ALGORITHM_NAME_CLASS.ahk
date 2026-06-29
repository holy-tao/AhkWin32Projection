#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_ALGORITHM_NAME_CLASS {
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
    static NCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SECRET_AGREEMENT_INTERFACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_SIGNATURE_INTERFACE => 5
}
