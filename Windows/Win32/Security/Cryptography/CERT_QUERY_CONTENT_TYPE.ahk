#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_QUERY_CONTENT_TYPE extends Win32Enum{

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
