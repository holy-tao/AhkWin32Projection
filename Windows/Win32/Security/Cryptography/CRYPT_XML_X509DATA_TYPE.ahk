#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_X509DATA_TYPE extends Win32Enum {

    /**
     * Native name: CRYPT_XML_X509DATA_TYPE_ISSUER_SERIAL
     * @type {Integer (UInt32)}
     */
    static ISSUER_SERIAL => 1

    /**
     * Native name: CRYPT_XML_X509DATA_TYPE_SKI
     * @type {Integer (UInt32)}
     */
    static SKI => 2

    /**
     * Native name: CRYPT_XML_X509DATA_TYPE_SUBJECT_NAME
     * @type {Integer (UInt32)}
     */
    static SUBJECT_NAME => 3

    /**
     * Native name: CRYPT_XML_X509DATA_TYPE_CERTIFICATE
     * @type {Integer (UInt32)}
     */
    static CERTIFICATE => 4

    /**
     * Native name: CRYPT_XML_X509DATA_TYPE_CRL
     * @type {Integer (UInt32)}
     */
    static CRL => 5

    /**
     * Native name: CRYPT_XML_X509DATA_TYPE_CUSTOM
     * @type {Integer (UInt32)}
     */
    static CUSTOM => 6
}
