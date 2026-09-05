#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_SELECT_CRITERIA_TYPE extends Win32Enum {

    /**
     * Native name: CERT_SELECT_BY_ENHKEY_USAGE
     * @type {Integer (UInt32)}
     */
    static BY_ENHKEY_USAGE => 1

    /**
     * Native name: CERT_SELECT_BY_KEY_USAGE
     * @type {Integer (UInt32)}
     */
    static BY_KEY_USAGE => 2

    /**
     * Native name: CERT_SELECT_BY_POLICY_OID
     * @type {Integer (UInt32)}
     */
    static BY_POLICY_OID => 3

    /**
     * Native name: CERT_SELECT_BY_PROV_NAME
     * @type {Integer (UInt32)}
     */
    static BY_PROV_NAME => 4

    /**
     * Native name: CERT_SELECT_BY_EXTENSION
     * @type {Integer (UInt32)}
     */
    static BY_EXTENSION => 5

    /**
     * Native name: CERT_SELECT_BY_SUBJECT_HOST_NAME
     * @type {Integer (UInt32)}
     */
    static BY_SUBJECT_HOST_NAME => 6

    /**
     * Native name: CERT_SELECT_BY_ISSUER_ATTR
     * @type {Integer (UInt32)}
     */
    static BY_ISSUER_ATTR => 7

    /**
     * Native name: CERT_SELECT_BY_SUBJECT_ATTR
     * @type {Integer (UInt32)}
     */
    static BY_SUBJECT_ATTR => 8

    /**
     * Native name: CERT_SELECT_BY_ISSUER_NAME
     * @type {Integer (UInt32)}
     */
    static BY_ISSUER_NAME => 9

    /**
     * Native name: CERT_SELECT_BY_PUBLIC_KEY
     * @type {Integer (UInt32)}
     */
    static BY_PUBLIC_KEY => 10

    /**
     * Native name: CERT_SELECT_BY_TLS_SIGNATURES
     * @type {Integer (UInt32)}
     */
    static BY_TLS_SIGNATURES => 11
}
