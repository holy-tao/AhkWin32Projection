#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_SECURITY_ATTRIBUTE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE => 2
}
