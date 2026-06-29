#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_X509DATA_TYPE {
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
    static CRYPT_XML_X509DATA_TYPE_ISSUER_SERIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_X509DATA_TYPE_SKI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_X509DATA_TYPE_SUBJECT_NAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_X509DATA_TYPE_CERTIFICATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_X509DATA_TYPE_CRL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_X509DATA_TYPE_CUSTOM => 6
}
