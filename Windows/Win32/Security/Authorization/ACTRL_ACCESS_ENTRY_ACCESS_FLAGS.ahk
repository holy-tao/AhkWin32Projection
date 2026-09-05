#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class ACTRL_ACCESS_ENTRY_ACCESS_FLAGS extends Win32Enum {

    /**
     * Native name: ACTRL_ACCESS_ALLOWED
     * @type {Integer (UInt32)}
     */
    static ALLOWED => 1

    /**
     * Native name: ACTRL_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static DENIED => 2

    /**
     * Native name: ACTRL_AUDIT_SUCCESS
     * @type {Integer (UInt32)}
     */
    static AUDIT_SUCCESS => 4

    /**
     * Native name: ACTRL_AUDIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static AUDIT_FAILURE => 8
}
