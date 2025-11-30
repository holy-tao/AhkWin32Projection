#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_PRIVILEGES_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_ENABLED_BY_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_REMOVED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SE_PRIVILEGE_USED_FOR_ACCESS => 2147483648
}
