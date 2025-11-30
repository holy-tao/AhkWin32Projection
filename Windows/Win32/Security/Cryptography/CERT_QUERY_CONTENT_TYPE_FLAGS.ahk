#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_QUERY_CONTENT_TYPE_FLAGS extends Win32Enum{

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
