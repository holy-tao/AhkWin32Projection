#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_RDN_ATTR_VALUE_TYPE extends Win32Enum {

    /**
     * Native name: CERT_RDN_ANY_TYPE
     * @type {Integer (Int32)}
     */
    static ANY_TYPE => 0

    /**
     * Native name: CERT_RDN_NUMERIC_STRING
     * @type {Integer (Int32)}
     */
    static NUMERIC_STRING => 3

    /**
     * Native name: CERT_RDN_PRINTABLE_STRING
     * @type {Integer (Int32)}
     */
    static PRINTABLE_STRING => 4

    /**
     * Native name: CERT_RDN_T61_STRING
     * @type {Integer (Int32)}
     */
    static T61_STRING => 5

    /**
     * Native name: CERT_RDN_VIDEOTEX_STRING
     * @type {Integer (Int32)}
     */
    static VIDEOTEX_STRING => 6

    /**
     * Native name: CERT_RDN_IA5_STRING
     * @type {Integer (Int32)}
     */
    static IA5_STRING => 7

    /**
     * Native name: CERT_RDN_GRAPHIC_STRING
     * @type {Integer (Int32)}
     */
    static GRAPHIC_STRING => 8

    /**
     * Native name: CERT_RDN_ISO646_STRING
     * @type {Integer (Int32)}
     */
    static ISO646_STRING => 9

    /**
     * Native name: CERT_RDN_GENERAL_STRING
     * @type {Integer (Int32)}
     */
    static GENERAL_STRING => 10

    /**
     * Native name: CERT_RDN_INT4_STRING
     * @type {Integer (Int32)}
     */
    static INT4_STRING => 11

    /**
     * Native name: CERT_RDN_UNICODE_STRING
     * @type {Integer (Int32)}
     */
    static UNICODE_STRING => 12

    /**
     * Native name: CERT_RDN_BMP_STRING
     * @type {Integer (Int32)}
     */
    static BMP_STRING => 12

    /**
     * Native name: CERT_RDN_ENCODED_BLOB
     * @type {Integer (Int32)}
     */
    static ENCODED_BLOB => 1

    /**
     * Native name: CERT_RDN_OCTET_STRING
     * @type {Integer (Int32)}
     */
    static OCTET_STRING => 2

    /**
     * Native name: CERT_RDN_TELETEX_STRING
     * @type {Integer (Int32)}
     */
    static TELETEX_STRING => 5

    /**
     * Native name: CERT_RDN_UNIVERSAL_STRING
     * @type {Integer (Int32)}
     */
    static UNIVERSAL_STRING => 11

    /**
     * Native name: CERT_RDN_UTF8_STRING
     * @type {Integer (Int32)}
     */
    static UTF8_STRING => 13

    /**
     * Native name: CERT_RDN_VISIBLE_STRING
     * @type {Integer (Int32)}
     */
    static VISIBLE_STRING => 9
}
