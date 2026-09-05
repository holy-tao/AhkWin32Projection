#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_STRING extends Win32Enum {

    /**
     * Native name: CRYPT_STRING_BASE64HEADER
     * @type {Integer (UInt32)}
     */
    static BASE64HEADER => 0

    /**
     * Native name: CRYPT_STRING_BASE64
     * @type {Integer (UInt32)}
     */
    static BASE64 => 1

    /**
     * Native name: CRYPT_STRING_BINARY
     * @type {Integer (UInt32)}
     */
    static BINARY => 2

    /**
     * Native name: CRYPT_STRING_BASE64REQUESTHEADER
     * @type {Integer (UInt32)}
     */
    static BASE64REQUESTHEADER => 3

    /**
     * Native name: CRYPT_STRING_HEX
     * @type {Integer (UInt32)}
     */
    static HEX => 4

    /**
     * Native name: CRYPT_STRING_HEXASCII
     * @type {Integer (UInt32)}
     */
    static HEXASCII => 5

    /**
     * Native name: CRYPT_STRING_BASE64X509CRLHEADER
     * @type {Integer (UInt32)}
     */
    static BASE64X509CRLHEADER => 9

    /**
     * Native name: CRYPT_STRING_HEXADDR
     * @type {Integer (UInt32)}
     */
    static HEXADDR => 10

    /**
     * Native name: CRYPT_STRING_HEXASCIIADDR
     * @type {Integer (UInt32)}
     */
    static HEXASCIIADDR => 11

    /**
     * Native name: CRYPT_STRING_HEXRAW
     * @type {Integer (UInt32)}
     */
    static HEXRAW => 12

    /**
     * Native name: CRYPT_STRING_STRICT
     * @type {Integer (UInt32)}
     */
    static STRICT => 536870912

    /**
     * Native name: CRYPT_STRING_BASE64_ANY
     * @type {Integer (UInt32)}
     */
    static BASE64_ANY => 6

    /**
     * Native name: CRYPT_STRING_ANY
     * @type {Integer (UInt32)}
     */
    static ANY => 7

    /**
     * Native name: CRYPT_STRING_HEX_ANY
     * @type {Integer (UInt32)}
     */
    static HEX_ANY => 8
}
