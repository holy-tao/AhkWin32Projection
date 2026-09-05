#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_SECURITY_ATTRIBUTE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE
     * @type {Integer (UInt32)}
     */
    static NON_INHERITABLE => 1

    /**
     * Native name: AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE
     * @type {Integer (UInt32)}
     */
    static VALUE_CASE_SENSITIVE => 2
}
