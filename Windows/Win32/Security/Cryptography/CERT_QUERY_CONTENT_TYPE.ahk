#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_QUERY_CONTENT_TYPE {
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
    static CERT_QUERY_CONTENT_CERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_CTL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_CRL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_SERIALIZED_STORE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_SERIALIZED_CERT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_SERIALIZED_CTL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_SERIALIZED_CRL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_PKCS7_SIGNED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_PKCS7_UNSIGNED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_PKCS10 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_PFX => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_CERT_PAIR => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_PFX_AND_LOAD => 14
}
