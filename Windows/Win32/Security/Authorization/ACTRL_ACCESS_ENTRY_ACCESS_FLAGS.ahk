#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class ACTRL_ACCESS_ENTRY_ACCESS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_ACCESS_ALLOWED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_ACCESS_DENIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_AUDIT_SUCCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_AUDIT_FAILURE => 8
}
