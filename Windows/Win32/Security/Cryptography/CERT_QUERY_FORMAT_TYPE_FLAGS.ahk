#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_QUERY_FORMAT_TYPE_FLAGS {
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
    static CERT_QUERY_FORMAT_FLAG_BINARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_FORMAT_FLAG_ALL => 14
}
