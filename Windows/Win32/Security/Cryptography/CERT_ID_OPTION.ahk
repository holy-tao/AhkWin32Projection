#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ID_OPTION {
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
    static CERT_ID_ISSUER_SERIAL_NUMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ID_KEY_IDENTIFIER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ID_SHA1_HASH => 3
}
