#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEYINFO_TYPE {
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
    static CRYPT_XML_KEYINFO_TYPE_KEYNAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_KEYVALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_RETRIEVAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_X509DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_KEYINFO_TYPE_CUSTOM => 5
}
