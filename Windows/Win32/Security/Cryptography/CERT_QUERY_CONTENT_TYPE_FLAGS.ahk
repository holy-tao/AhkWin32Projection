#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_QUERY_CONTENT_TYPE_FLAGS extends Win32Enum {

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_CERT
     * @type {Integer (UInt32)}
     */
    static FLAG_CERT => 2

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_CTL
     * @type {Integer (UInt32)}
     */
    static FLAG_CTL => 4

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_CRL
     * @type {Integer (UInt32)}
     */
    static FLAG_CRL => 8

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE
     * @type {Integer (UInt32)}
     */
    static FLAG_SERIALIZED_STORE => 16

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT
     * @type {Integer (UInt32)}
     */
    static FLAG_SERIALIZED_CERT => 32

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL
     * @type {Integer (UInt32)}
     */
    static FLAG_SERIALIZED_CTL => 64

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL
     * @type {Integer (UInt32)}
     */
    static FLAG_SERIALIZED_CRL => 128

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED
     * @type {Integer (UInt32)}
     */
    static FLAG_PKCS7_SIGNED => 256

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED
     * @type {Integer (UInt32)}
     */
    static FLAG_PKCS7_UNSIGNED => 512

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED
     * @type {Integer (UInt32)}
     */
    static FLAG_PKCS7_SIGNED_EMBED => 1024

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_PKCS10
     * @type {Integer (UInt32)}
     */
    static FLAG_PKCS10 => 2048

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_PFX
     * @type {Integer (UInt32)}
     */
    static FLAG_PFX => 4096

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_CERT_PAIR
     * @type {Integer (UInt32)}
     */
    static FLAG_CERT_PAIR => 8192

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD
     * @type {Integer (UInt32)}
     */
    static FLAG_PFX_AND_LOAD => 16384

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_ALL
     * @type {Integer (UInt32)}
     */
    static FLAG_ALL => 16382

    /**
     * Native name: CERT_QUERY_CONTENT_FLAG_ALL_ISSUER_CERT
     * @type {Integer (UInt32)}
     */
    static FLAG_ALL_ISSUER_CERT => 818
}
