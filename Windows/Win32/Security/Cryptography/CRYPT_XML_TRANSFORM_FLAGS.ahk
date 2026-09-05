#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_XML_TRANSFORM_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPT_XML_TRANSFORM_ON_STREAM
     * @type {Integer (UInt32)}
     */
    static ON_STREAM => 1

    /**
     * Native name: CRYPT_XML_TRANSFORM_ON_NODESET
     * @type {Integer (UInt32)}
     */
    static ON_NODESET => 2

    /**
     * Native name: CRYPT_XML_TRANSFORM_URI_QUERY_STRING
     * @type {Integer (UInt32)}
     */
    static URI_QUERY_STRING => 3
}
