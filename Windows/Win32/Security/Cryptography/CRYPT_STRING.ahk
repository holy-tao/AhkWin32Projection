#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_STRING extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_BASE64HEADER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_BASE64 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_BINARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_BASE64REQUESTHEADER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_HEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_HEXASCII => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_BASE64X509CRLHEADER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_HEXADDR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_HEXASCIIADDR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_HEXRAW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_STRICT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_BASE64_ANY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_ANY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_STRING_HEX_ANY => 8
}
