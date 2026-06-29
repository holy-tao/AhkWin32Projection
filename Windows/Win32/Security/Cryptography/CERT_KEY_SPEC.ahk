#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_KEY_SPEC {
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
    static AT_KEYEXCHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AT_SIGNATURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_NCRYPT_KEY_SPEC => 4294967295
}
