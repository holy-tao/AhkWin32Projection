#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_STATUS_ERROR_STATUS {
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
    static CRYPT_XML_STATUS_ERROR_NOT_RESOLVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_DIGEST_INVALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_ALGORITHM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_NOT_SUPPORTED_TRANSFORM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_SIGNATURE_INVALID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_ERROR_KEYINFO_NOT_PARSED => 131072
}
