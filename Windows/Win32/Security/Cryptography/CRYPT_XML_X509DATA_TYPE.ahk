#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_X509DATA_TYPE extends Win32Enum{

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
