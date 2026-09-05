#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE extends Win32Enum {

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64
     * @type {Integer (UInt16)}
     */
    static INT64 => 1

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64
     * @type {Integer (UInt16)}
     */
    static UINT64 => 2

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING
     * @type {Integer (UInt16)}
     */
    static STRING => 3

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING
     * @type {Integer (UInt16)}
     */
    static OCTET_STRING => 16

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN
     * @type {Integer (UInt16)}
     */
    static FQBN => 4

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_SID
     * @type {Integer (UInt16)}
     */
    static SID => 5

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN
     * @type {Integer (UInt16)}
     */
    static BOOLEAN => 6
}
