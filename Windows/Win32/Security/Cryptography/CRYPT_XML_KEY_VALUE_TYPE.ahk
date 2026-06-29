#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_VALUE_TYPE {
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
    static CRYPT_XML_KEY_VALUE_TYPE_DSA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEY_VALUE_TYPE_RSA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEY_VALUE_TYPE_ECDSA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEY_VALUE_TYPE_CUSTOM => 4
}
