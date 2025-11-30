#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SELECT_CRITERIA_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_ENHKEY_USAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_KEY_USAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_POLICY_OID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_PROV_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_EXTENSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_SUBJECT_HOST_NAME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_ISSUER_ATTR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_SUBJECT_ATTR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_ISSUER_NAME => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_PUBLIC_KEY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SELECT_BY_TLS_SIGNATURES => 11
}
