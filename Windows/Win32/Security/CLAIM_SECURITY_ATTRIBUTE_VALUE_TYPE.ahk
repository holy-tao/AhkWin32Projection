#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64 => 1

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64 => 2

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING => 3

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING => 16

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN => 4

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_SID => 5

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN => 6
}
