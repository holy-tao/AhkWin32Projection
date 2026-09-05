#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_QUERY_CONTENT_TYPE extends Win32Enum {

    /**
     * Native name: CERT_QUERY_CONTENT_CERT
     * @type {Integer (UInt32)}
     */
    static CERT => 1

    /**
     * Native name: CERT_QUERY_CONTENT_CTL
     * @type {Integer (UInt32)}
     */
    static CTL => 2

    /**
     * Native name: CERT_QUERY_CONTENT_CRL
     * @type {Integer (UInt32)}
     */
    static CRL => 3

    /**
     * Native name: CERT_QUERY_CONTENT_SERIALIZED_STORE
     * @type {Integer (UInt32)}
     */
    static SERIALIZED_STORE => 4

    /**
     * Native name: CERT_QUERY_CONTENT_SERIALIZED_CERT
     * @type {Integer (UInt32)}
     */
    static SERIALIZED_CERT => 5

    /**
     * Native name: CERT_QUERY_CONTENT_SERIALIZED_CTL
     * @type {Integer (UInt32)}
     */
    static SERIALIZED_CTL => 6

    /**
     * Native name: CERT_QUERY_CONTENT_SERIALIZED_CRL
     * @type {Integer (UInt32)}
     */
    static SERIALIZED_CRL => 7

    /**
     * Native name: CERT_QUERY_CONTENT_PKCS7_SIGNED
     * @type {Integer (UInt32)}
     */
    static PKCS7_SIGNED => 8

    /**
     * Native name: CERT_QUERY_CONTENT_PKCS7_UNSIGNED
     * @type {Integer (UInt32)}
     */
    static PKCS7_UNSIGNED => 9

    /**
     * Native name: CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED
     * @type {Integer (UInt32)}
     */
    static PKCS7_SIGNED_EMBED => 10

    /**
     * Native name: CERT_QUERY_CONTENT_PKCS10
     * @type {Integer (UInt32)}
     */
    static PKCS10 => 11

    /**
     * Native name: CERT_QUERY_CONTENT_PFX
     * @type {Integer (UInt32)}
     */
    static PFX => 12

    /**
     * Native name: CERT_QUERY_CONTENT_CERT_PAIR
     * @type {Integer (UInt32)}
     */
    static CERT_PAIR => 13

    /**
     * Native name: CERT_QUERY_CONTENT_PFX_AND_LOAD
     * @type {Integer (UInt32)}
     */
    static PFX_AND_LOAD => 14
}
