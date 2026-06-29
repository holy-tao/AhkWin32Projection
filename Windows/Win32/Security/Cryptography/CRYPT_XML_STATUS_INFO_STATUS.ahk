#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_STATUS_INFO_STATUS {
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
    static CRYPT_XML_STATUS_INTERNAL_REFERENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_KEY_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_DIGESTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_DIGEST_VALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_SIGNATURE_VALID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_STATUS_OPENED_TO_ENCODE => 2147483648
}
