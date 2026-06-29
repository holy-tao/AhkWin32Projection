#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_QUERY_CONTENT_TYPE_FLAGS {
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
    static CERT_QUERY_CONTENT_FLAG_CERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_CTL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_CRL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_PKCS10 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_PFX => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_CERT_PAIR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_ALL => 16382

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_QUERY_CONTENT_FLAG_ALL_ISSUER_CERT => 818
}
