#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 */
class CLAIM_SECURITY_ATTRIBUTE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE
     * @type {Integer (UInt32)}
     */
    static NON_INHERITABLE => 1

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE
     * @type {Integer (UInt32)}
     */
    static VALUE_CASE_SENSITIVE => 2

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY
     * @type {Integer (UInt32)}
     */
    static USE_FOR_DENY_ONLY => 4

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DISABLED_BY_DEFAULT => 8

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 16

    /**
     * Native name: CLAIM_SECURITY_ATTRIBUTE_MANDATORY
     * @type {Integer (UInt32)}
     */
    static MANDATORY => 32
}
