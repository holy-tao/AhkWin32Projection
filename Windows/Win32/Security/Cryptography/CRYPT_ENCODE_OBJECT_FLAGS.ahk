#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_ENCODE_OBJECT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_ENCODE_ALLOC_FLAG
     * @type {Integer (UInt32)}
     */
    static ALLOC_FLAG => 32768

    /**
     * Native name: CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG
     * @type {Integer (UInt32)}
     */
    static ENABLE_PUNYCODE_FLAG => 131072

    /**
     * Native name: CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG
     * @type {Integer (UInt32)}
     */
    static UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG => 1073741824

    /**
     * Native name: CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG
     * @type {Integer (UInt32)}
     */
    static UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG => 2147483648

    /**
     * Native name: CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG
     * @type {Integer (UInt32)}
     */
    static UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG => 536870912
}
